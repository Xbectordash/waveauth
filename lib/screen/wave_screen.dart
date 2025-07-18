import 'dart:math';
import 'package:flutter/material.dart';
import 'package:waveauth/custom_painter/wave.dart';

class WaveScreen extends StatefulWidget {
  const WaveScreen({super.key});

  @override
  State<WaveScreen> createState() => _WaveScreenState();
}

class _WaveScreenState extends State<WaveScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> waveHeightAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    waveHeightAnim = Tween<double>(
      begin: 0,
      end: pi / 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: [
            CustomPaint(
              size: size,
              painter: SineWavePainter(
                animationValue: _controller.value,
                screenHeight: size.height * 0.25,
              ),
            ),
          ],
        );
      },
    );
  }
}
