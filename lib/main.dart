import 'package:appelsin/AppelsinTheme.dart';
import 'package:appelsin/DashBoardWidget.dart';
import 'package:appelsin/SmashPageWidget.dart';
import 'package:appelsin/bank/IncomeWidget.dart';
import 'package:appelsin/customer/CreateCustomerWidget.dart';
import 'package:appelsin/pincode/PinCodeSetupWidget.dart';
import 'package:appelsin/signup/NameWidget.dart';
import 'package:appelsin/signup/TelefonNummerWidget.dart';
import 'package:appelsin/signup/VerifyPhoneNumberWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';
import 'danskebank/OpretDbWidget.dart';
import 'package:appelsin/invoices/InvoiceWidget.dart';
import 'danskebank/CountryListWidget.dart';
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) =>InvoiceWidget(),
    ),
GoRoute(path: 'sms', builder: (_,state) { return VerifyPhoneNumberWidget(phoneNumber: 11233); }),
    GoRoute(path: 'email', builder: (_ ,state)  {
  return VerifyPhoneNumberWidget(phoneNumber: 123123)   ;
} ),
    GoRoute(path: 'login', builder: (_,state)  {
      final code = state.uri.queryParameters['code'] ?? '';
      final type = state.uri.queryParameters['type'] ?? '';
      return VerifyPhoneNumberWidget(phoneNumber: 11233);
    })
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Stripe

    await initUniLinks();
    runApp(const MyApp());
  } catch (e) {
    print("Initialization Error: $e");
  }
}
Future<void> initUniLinks() async {
  try {
    final initialUri = await getInitialUri();
    if (initialUri != null) {
      _handleIncomingLink(initialUri.toString());
    }

    linkStream.listen((String? link) {
      if (link != null) {
        _handleIncomingLink(link);
      }
    }, onError: (err) {
      print('Link error: $err');
    });
  } on FormatException catch (e) {
    print("Invalid URI format: $e");
  }
}

void _handleIncomingLink(String link) {
  //https://app.waken.dk/email?code=0906
  final uri = Uri.parse(link);
  final path = uri.path;
  final code = uri.queryParameters['code'] ?? '';

  print(path);
  print(code);

  if (path.contains('sms')) {
    _router.go('/sms'); // or use: _navigatorKey.currentState?.pushNamed('/sms');
  } else if (uri.path.contains('email')) {
    //https://app.waken.dk/email?code=0906
    _router.go('/email?code=${code}&type=email');
  } else if (uri.path.contains('smslogin')){
    _router.go('/login');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppelsinTheme.lightTheme(),
      routerConfig: _router ,

    );
  }
}


