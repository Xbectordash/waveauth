import 'package:flutter/material.dart';
import 'package:waveauth/custom_painter/otp_screen_painter.dart';

class OptBackground extends StatefulWidget {
  final Size size;
  const OptBackground({super.key, required this.size});

  @override
  State<OptBackground> createState() => _OptBackgroundState();
}

class _OptBackgroundState extends State<OptBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _waveAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _waveAnimation = Tween<double>(begin: 0, end: 0.3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return CustomPaint(
              size: widget.size,
              painter: OtpScreenPainter(_waveAnimation.value),
            );
          },
        ),
        Positioned(
          top: 50,
          right: 0,
          child: SizedBox(
            width: widget.size.width,
            height: widget.size.height*0.8,
            child: Image.asset("assets/phone_14.png"),
          ),
        ),
      ],
    );
  }
}
