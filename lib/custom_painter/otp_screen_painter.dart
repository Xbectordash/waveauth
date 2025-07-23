import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waveauth/util/const_colors.dart';
class OtpScreenPainter extends CustomPainter {
  final double value;
  const OtpScreenPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = AppColors.accent;

    final paint2 = Paint()..style = PaintingStyle.fill;
    paint2.color = AppColors.blue100;

    final waveOffset = sin(value * 2 * pi) * 20;
    final shift = size.height * 0.20; // 10% upward shift

    final path = Path();
    path.moveTo(0, size.height * 0.5 + waveOffset - shift);
    path.conicTo(
      size.width * 0.5,
      size.height * 0.8 + waveOffset - shift,
      size.width,
      size.height * 0.5 + waveOffset - shift,
      1,
    );
    path.lineTo(size.width, size.height * 0.8 + waveOffset - shift);
    path.conicTo(
      size.width * 0.5,
      size.height * 1.0 + waveOffset - shift,
      0,
      size.height * 0.8 + waveOffset - shift,
      1,
    );

    final path2 = Path();
    path2.moveTo(0, size.height * 0.4 + waveOffset - shift);
    path2.conicTo(
      size.width * 0.5,
      size.height * 0.825 + waveOffset - shift,
      size.width,
      size.height * 0.625 + waveOffset - shift,
      1,
    );
    path2.lineTo(size.width, size.height * 0.875 + waveOffset - shift);
    path2.conicTo(
      size.width * 0.5,
      size.height * 1.0 + waveOffset - shift,
      0,
      size.height * 0.8 + waveOffset - shift,
      1,
    );

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant OtpScreenPainter oldDelegate) {
    return true;
  }
}
