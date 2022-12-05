import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: (() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Agregar un lenguaje nuevo'),
              content: TextField(
                controller: _controller,
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final nombre = _controller.text;
                    _controller.clear();
                    FirebaseFirestore.instance.collection('lenguajes').add(
                        {'imagen': 'dart.png', 'votos': 0, 'nombre': nombre});

                    Navigator.of(context).pop();
                  },
                  child: Text('Crear'),
                )
              ],
            );
          },
        );
      }),
    );
  }
}
