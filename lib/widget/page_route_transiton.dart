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

  static Route slideFromRight(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route slideFromLeft(Widget page, {Duration duration = const Duration(milliseconds: 300)}) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
