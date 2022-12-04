import 'package:animaciones_implicitas/providers/contador_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context, status, _) {
        return Container(
          height: status.contador,
          width: status.contador,
          color: Colors.lightBlue,
          alignment: Alignment.center,
        );
      },
    );
  }
}
