import 'dart:async';

class ControlContador {
  int _contador = 0;
  final _streamControl = StreamController<int>(); //con este se abre
  Sink<int> get sink =>
      _streamControl.sink; // con esto se obtiene el sink desde el controlador
  Stream<int> get stream => _streamControl
      .stream; // con esto se obtiene el stream desde el controlador
  dispose() => _streamControl.close(); // con esto se cierra estos datos

  void incremet() {
    sink.add(++_contador);
  }
}
