import 'package:animaciones_implicitas/providers/contador_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedTextStyleWidget extends StatelessWidget {
  const AnimatedTextStyleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context, status, _) {
        return AnimatedContainer(
          height: 150,
          width: 150,
          color: status.contador % 2 == 0 ? Colors.lightBlue : Colors.lime,
          alignment: Alignment.center,
          duration: const Duration(seconds: 5),
          curve: Curves.easeInOut,
          child: AnimatedAlign(
            alignment: status.contador % 2 == 0
                ? Alignment.topCenter
                : Alignment.bottomCenter,
            duration: const Duration(milliseconds: 2500),
            child: Container(
              height: 70,
              width: 70,
              color: Colors.red,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 2500),
                style: TextStyle(
                    color:
                        status.contador % 2 == 0 ? Colors.white : Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                child: const Text('Hola'),
              ),
            ),
          ),
        );
      },
    );
  }
}
