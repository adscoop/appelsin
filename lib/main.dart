import 'package:appelsin/AppelsinTheme.dart';
import 'package:appelsin/DashBoardWidget.dart';
import 'package:appelsin/SmashPageWidget.dart';
import 'package:appelsin/bank/IncomeWidget.dart';
import 'package:appelsin/customer/CreateCustomerWidget.dart';
import 'package:appelsin/danskebank/NuVaerendeBankWidget.dart';
import 'package:appelsin/pincode/PinCodeSetupWidget.dart';
import 'package:appelsin/recipie/RecipieCameraWidget.dart';
import 'package:appelsin/signup/NameWidget.dart';
import 'package:appelsin/signup/TelefonNummerWidget.dart';
import 'package:appelsin/signup/VerifyPhoneNumberWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';
import 'kyc//OpretDbWidget.dart';
import 'package:appelsin/invoices/InvoiceWidget.dart';
import 'kyc//CountryListWidget.dart';
import 'package:appelsin/recipie/RecipieCameraWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => Opretdbwidget(email: 'thomas@kleist-it.com')
    ),
    GoRoute(path: 'sms', builder: (_ ,state)  {
      final code =  int.parse(state.uri.queryParameters['code'] ?? '');
      final phone =  int.parse(state.uri.queryParameters['phone'] ?? '');
      
  return VerifyPhoneNumberWidget(phoneNumber: phone, code: code, )   ;
} ),
    GoRoute(path: 'login', builder: (_,state)  {
      final code =  int.parse(state.uri.queryParameters['code'] ?? '');
      final phone =  int.parse(state.uri.queryParameters['phone'] ?? '');
       
      return VerifyPhoneNumberWidget(phoneNumber: phone, code: code,);
    })
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Clear SharedPreferences on app load
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("captured_pictures_b64");

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


