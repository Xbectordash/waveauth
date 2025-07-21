import 'dart:math';

import 'package:flutter/material.dart';
import 'package:waveauth/util/const_colors.dart';

class GradientButton extends StatefulWidget {
  final String buttonText;
  final double? buttonHeigth;
  final double? buttonWidth;
  final double? radius;
  final VoidCallback onPressed;
  final bool? isInvert;

  const GradientButton({
    super.key,
    required this.buttonText,
    this.buttonHeigth = 50,
    this.buttonWidth = 340,
    this.radius = 12,
    this.isInvert = false,
    required this.onPressed,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _blurAnim;
  late final Animation<double> _spreadAnim;
  late final Animation<Offset> _offsetAnim;
  late final Animation<double> _borderAnim;
  late final AnimationController _borderAnimController;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _borderAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    //     final curved2 = CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );

    _blurAnim = Tween<double>(begin: 12, end: 25).animate(curved);
    _spreadAnim = Tween<double>(begin: 2, end: 4).animate(curved);
    _offsetAnim = Tween<Offset>(
      begin: const Offset(2, 2),
      end: const Offset(5, 5),
    ).animate(curved);
    _borderAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_borderAnimController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _borderAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(widget.radius!);
    final isInvert = widget.isInvert!;
    final gradient = AppGradients.mainGradient;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
          height: widget.buttonHeigth,
          width: widget.buttonWidth,
          child: CustomPaint(
            painter: _BorderGradientPainter(
              animationValue: _borderAnim.value,
              borderRadius: widget.radius!,
            ),
            child: Container(
              margin: isInvert ? const EdgeInsets.all(2) : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isInvert ? Colors.white : null,
                gradient: isInvert ? null : gradient,
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(100),
                    blurRadius: _blurAnim.value,
                    spreadRadius: _spreadAnim.value,
                    offset: _offsetAnim.value,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                ),
                child: Center(
                  child: ShaderMask(
                    blendMode: isInvert ? BlendMode.srcIn : BlendMode.dst,
                    shaderCallback: (bounds) {
                      final shaderGradient = isInvert
                          ? AppGradients.mainGradient
                          : const LinearGradient(
                              colors: [Colors.white, Colors.white],
                            );
                      return shaderGradient.createShader(
                        Offset.zero & bounds.size,
                      );
                    },
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BorderGradientPainter extends CustomPainter {
  final double animationValue;
  final double borderRadius;

  _BorderGradientPainter({
    required this.animationValue,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect.deflate(1.5),
      Radius.circular(borderRadius),
    );

    // 🌀 Circular rotating border animation
    final sweepGradient = SweepGradient(
      startAngle: 0,
      endAngle: 2 * pi, // 2π radians (full circle)
      transform: GradientRotation(animationValue * 18.28319),
      colors: [
        Colors.white.withOpacity(0.0),
        AppColors.primary,
        AppColors.accent,
        Colors.white.withOpacity(0.0),
      ],
      stops: const [0.0, 0.3, 0.7, 1.0],
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _BorderGradientPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
