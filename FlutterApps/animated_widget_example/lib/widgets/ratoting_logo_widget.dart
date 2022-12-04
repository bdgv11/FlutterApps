import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingLogoWidget extends AnimatedWidget {
  final AnimationController _controller;

  const RotatingLogoWidget({required AnimationController controller})
      : _controller = controller,
        super(listenable: controller);

  static const _fullRotation = 2 * math.pi;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _controller.value * _fullRotation,
      child: const FlutterLogo(),
    );
  }
}
