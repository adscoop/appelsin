import 'package:flutter/material.dart';
import 'SlideDirection.dart';


void navigateWithSlide(BuildContext context, Widget page, SlideDirection direction) {
  Offset begin;

  switch (direction) {
    case SlideDirection.left:
      begin = const Offset(-1.0, 0.0); // from left
      break;
    case SlideDirection.right:
      begin = const Offset(1.0, 0.0); // from right
      break;
    case SlideDirection.up:
      begin = const Offset(0.0, 1.0); // from bottom
      break;
    case SlideDirection.down:
      begin = const Offset(0.0, -1.0); // from top
      break;
  }

  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  // Use the root navigator to ensure navigation also works with MaterialApp.router / GoRouter
  Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ));
}
