import 'package:appelsin/AppelsinTheme.dart';
import 'package:appelsin/DashBoardWidget.dart';
import 'package:appelsin/bank/IncomeWidget.dart';
import 'package:appelsin/signup/ChatBotWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => Dashboardwidget(),
    ),

  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Appelsin',
theme: Appelsintheme.lightTheme(),
      routerConfig: _router,
    );
  }
}


