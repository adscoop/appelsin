import 'package:appelsin/LoginWidget.dart';
import 'package:appelsin/SmashPageWidget.dart';
import 'package:appelsin/appelsinkonto/AppelsinKontoWidget.dart';
import 'package:appelsin/price/PriceWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/NotificationService.dart';

// --- Your app imports ---
import 'package:appelsin/AppelsinTheme.dart';
import 'kyc/OpretDbWidget.dart';
import 'package:appelsin/signup/VerifyPhoneNumberWidget.dart';
import 'package:appelsin/createbusiess/CompanyCVRDetailsWidget.dart';


final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

/// If the app is launched via a Universal Link, we stash the route here and
/// navigate after runApp to avoid any race conditions.
String? _pendingInitialRoute;

/// go_router with absolute paths and safe parsing of query parameters.
final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => SmashPageWidget(),
    ),

    GoRoute(
      path: '/login',
      builder: (_, state) {
        final code  = int.tryParse(state.uri.queryParameters['code'] ?? '');
        final phone = state.uri.queryParameters['phone'] ?? '';
        return Loginwidget(


        );
      },
    )
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase (required for FCM)
    await Firebase.initializeApp();

    // Example: clear a specific pref key on launch
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("captured_pictures_b64");

    // Prepare deep links (sets _pendingInitialRoute if app launched by UL)
    await _initUniLinks();

    // Initialize notifications (permissions, token, handlers)
    await NotificationService().init();

    // Start the app
    runApp(const MyApp());

    // After the first frame, navigate to the initial deep link route if present
    if (_pendingInitialRoute != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final route = _pendingInitialRoute!;
        _pendingInitialRoute = null;
        _router.go(route);
      });
    }
  } catch (e) {
    // Don’t crash the app on init errors; just log
    // (use your logger)
    // ignore: avoid_print
    print("Initialization Error: $e");
    runApp(const MyApp());
  }
}

/// Initialize uni_links for both the initial link and subsequent links.
Future<void> _initUniLinks() async {
  try {
    // If the app was cold-started by a Universal Link
    final initialUri = await getInitialUri();
    if (initialUri != null) {
      _pendingInitialRoute = _internalRouteFromUri(initialUri);
    }

    // While the app is running (foreground/background → foreground)
    linkStream.listen((String? link) {
      if (link == null) return;
      final uri = Uri.parse(link);
      final internal = _internalRouteFromUri(uri);
      _router.go(internal);
    }, onError: (err) {
      // ignore: avoid_print
      print('Link error: $err');
    });
  } on FormatException catch (e) {
    // ignore: avoid_print
    print("Invalid URI format: $e");
  }
}

/// Convert an incoming https://link.appelsin.dk/... URI into an internal
/// app route understood by go_router, preserving the query string.
/// Example:
///   https://link.appelsin.dk/sms?code=123  ->  /sms?code=123
String _internalRouteFromUri(Uri uri) {
  // Only care about path + query; host should be link.appelsin.dk thanks to AASA.
  final internal = Uri(path: uri.path, query: uri.query).toString();
  // ignore: avoid_print
  print('🔗 Routing incoming UL to: $internal');
  return internal;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Appelsin',
      theme: AppelsinTheme.lightTheme(),
      routerConfig: _router,
    );
  }
}
