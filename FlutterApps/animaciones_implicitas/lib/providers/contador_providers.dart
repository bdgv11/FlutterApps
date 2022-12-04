import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier {
  double _contador;

  double get contador => _contador;

  set contador(double value) {
    _contador = value;
  }

  ContadorProvider(this._contador);

  void increment() {
    _contador++;
    notifyListeners();
  }
}
