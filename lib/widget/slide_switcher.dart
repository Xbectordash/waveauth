import 'package:flutter/material.dart';

class SlideSwitcher extends StatelessWidget {
  final Widget child;
  final AxisDirection direction;
  final Duration duration;

  const SlideSwitcher({
    super.key,
    required this.child,
    this.direction = AxisDirection.left,
    this.duration = const Duration(milliseconds: 300),
  });

  Offset _getBeginOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.left:
        return const Offset(1.0, 0.0);
      case AxisDirection.right:
        return const Offset(-1.0, 0.0);
      case AxisDirection.up:
        return const Offset(0.0, 1.0);
      case AxisDirection.down:
        return const Offset(0.0, -1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: _getBeginOffset(direction),
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}
