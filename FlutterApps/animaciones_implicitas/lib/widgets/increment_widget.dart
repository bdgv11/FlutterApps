import 'package:animaciones_implicitas/providers/contador_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncrementWidget extends StatelessWidget {
  const IncrementWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<ContadorProvider>(
      builder: (context, status, _) {
        return FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            status.increment();
          },
        );
      },
    );
  }
}
