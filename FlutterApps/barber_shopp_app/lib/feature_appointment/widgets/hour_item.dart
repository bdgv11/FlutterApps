import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HourItem extends StatelessWidget {
  //
  final String barbero;
  final String cliente;
  final String fecha;
  final String hora;
  final bool horaDisponible;
  final String tipoServicio;
  final QueryDocumentSnapshot _snapshot;

  HourItem(this._snapshot)
      : barbero = _snapshot.get('Barbero') as String,
        cliente = _snapshot.get('Cliente') as String,
        fecha = _snapshot.get('Fecha') as String,
        hora = _snapshot.get('Hora') as String,
        horaDisponible = _snapshot.get('HoraDisponible') as bool,
        tipoServicio = _snapshot.get('TipoServicio') as String;

  @override
  Widget build(BuildContext context) {
    String _hora;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 30,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          _hora = hora;
          Text('data');
        },
        child: Text(
          '${hora}',
          style: TextStyle(color: Colors.black, fontFamily: 'Barlow'),
        ),
      ),
    );
  }
}
