import 'package:animaciones_implicitas/providers/contador_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedContainerWidget2 extends StatelessWidget {
  const AnimatedContainerWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context, status, _) {
        return AnimatedContainer(
          height: 70,
          width: 70,
          color: status.contador % 2 == 0 ? Colors.lightBlue : Colors.lime,
          alignment: Alignment.center,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
