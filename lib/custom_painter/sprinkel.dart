import 'dart:math';
import 'package:flutter/material.dart';

class WindParticleEffect extends StatefulWidget {
  final double width;
  final double height;
  final int particleCount;
  final Widget child;

  const WindParticleEffect({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 150,
    this.particleCount = 25,
  });

  @override
  State<WindParticleEffect> createState() => _WindParticleEffectState();
}

class _WindParticleEffectState extends State<WindParticleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Particle> _particles;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _particles = List.generate(widget.particleCount, (_) => _randomParticle());
  }

  _Particle _randomParticle() {
    return _Particle(
      angle: _random.nextDouble() * 2 * pi,
      radius: 1 + _random.nextDouble() * 2,
      speed: 0.2 + _random.nextDouble() * 0.5,
      orbitRadius: 20 + _random.nextDouble() * 50,
      centerX:
          widget.width / 2 +
          (_random.nextDouble() * widget.width / 3 - widget.width / 6),
      centerY:
          widget.height / 2 +
          (_random.nextDouble() * widget.height / 3 - widget.height / 6),
      opacity: 0.3 + _random.nextDouble() * 0.3,
      phaseOffset: _random.nextDouble() * 2 * pi,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return CustomPaint(
                painter: _ParticlePainter(
                  particles: _particles,
                  animationValue: _controller.value,
                ),
              );
            },
          ),
          Positioned.fill(child: Center(child: widget.child)),
        ],
      ),
    );
  }
}

class _Particle {
  double angle,
      radius,
      speed,
      orbitRadius,
      centerX,
      centerY,
      opacity,
      phaseOffset;

  _Particle({
    required this.angle,
    required this.radius,
    required this.speed,
    required this.orbitRadius,
    required this.centerX,
    required this.centerY,
    required this.opacity,
    required this.phaseOffset,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double animationValue;

  _ParticlePainter({required this.particles, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final p in particles) {
      final time = animationValue + p.phaseOffset;

      final dx = p.centerX + cos(time * pi * 2 * p.speed) * p.orbitRadius;
      final dy = p.centerY + sin(time * pi * 2 * p.speed) * p.orbitRadius;
      paint.color = const Color(
        0xFF3D5AFE,
      ).withAlpha((p.opacity * (1 - animationValue) * 255).toInt());

      canvas.drawCircle(Offset(dx, dy), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
