import 'package:flutter/material.dart';
import '../models/item.dart';

class SuccessWidget extends StatelessWidget {
  final Item? item;
  const SuccessWidget(this.item);

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      return Text('${item!.id} - ${item!.title}');
    } else {
      return Text('No hay datos para mostrar!');
    }
  }
}
