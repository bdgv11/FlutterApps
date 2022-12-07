import 'package:animated_widget_example/widgets/ratoting_logo_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SpinnerController());
}

class SpinnerController extends StatefulWidget {
  const SpinnerController({super.key});

  @override
  State<SpinnerController> createState() => _SpinnerControllerState();
}

class _SpinnerControllerState extends State<SpinnerController>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: RotatingLogoWidget(controller: _controller));
  }
}
