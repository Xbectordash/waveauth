import 'package:flutter/material.dart';

class CustomPageTransition {
  static Route fade(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
