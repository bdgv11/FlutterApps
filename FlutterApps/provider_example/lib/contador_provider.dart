import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier {
  int _contador;

  int get contador => _contador;

  set contador(int value) {
    _contador = value;
  }

  ContadorProvider(this._contador);

  void increment() {
    _contador++;
    notifyListeners();
  }
}
