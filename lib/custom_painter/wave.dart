import 'dart:math';
import 'package:flutter/material.dart';

class SineWavePainter extends CustomPainter {
  final double animationValue;
  final double screenHeight;

  SineWavePainter({required this.animationValue, required this.screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final double baseY = screenHeight;
    final double centerX = size.width / 2;
    final double waveLength = size.width;
    final int resolution = 500;
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF3D5AFE), // Indigo A400 (deep bluish)
        Color(0xFF00CFFF), // Lighter cyan
      ],
    );

    // Wave Layers: back to front
    final waveLayers = [
      {
        'color': Colors.blue.shade100,
        'minBump': 4.0,
        'maxBump': 16.0,
        'offsetY': 18.0,
      },
      {
        'color': Colors.blue.shade300,
        'minBump': 6.0,
        'maxBump': 24.0,
        'offsetY': 9.0,
      },
      {
        'gradient': gradient, // ✅ Pass the gradient itself
        'minBump': 8.0,
        'maxBump': 32.0,
        'offsetY': 0.0,
      },
    ];

    double? centerY;

    for (var layer in waveLayers) {
      final path = Path();
      path.moveTo(0, 0);
      path.lineTo(0, screenHeight);
      final paint = Paint()..style = PaintingStyle.fill;

      if (layer.containsKey('color')) {
        paint.color = layer['color'] as Color;
      } else if (layer.containsKey('gradient')) {
        final Rect rect = Rect.fromLTWH(0, 0, size.width, screenHeight);
        final Gradient layerGradient = layer['gradient'] as Gradient;
        paint.shader = layerGradient.createShader(rect);
      }

      double minBump = layer['minBump'] as double;
      double maxBump = layer['maxBump'] as double;
      double offsetY = layer['offsetY'] as double;

      for (int i = 0; i <= resolution; i++) {
        double x = i * (waveLength / resolution);
        double distanceFromCenter = ((x - centerX).abs()) / centerX;
        double centerOscillation = sin(animationValue * 4 * pi) * 3;
        double bump =
            minBump +
            (maxBump - minBump) * distanceFromCenter +
            centerOscillation * (1 - distanceFromCenter);
        double y =
            baseY +
            sin((x / waveLength * 2 * pi) - animationValue * 2 * pi) * bump +
            offsetY;

        path.lineTo(x, y);

        if (offsetY == 0 && (x - centerX).abs() < 2) {
          centerY = y;
        }
      }

      path.lineTo(size.width, screenHeight);
      path.lineTo(size.width, 0);
      path.close();

      canvas.drawPath(path, paint);
    }

    if (centerY != null) {
      final bobberPaint = Paint()..color = Colors.white;
      canvas.drawCircle(Offset(centerX, centerY - 6), 5, bobberPaint);
    }
  }

  @override
  bool shouldRepaint(covariant SineWavePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.screenHeight != screenHeight;
  }
}
