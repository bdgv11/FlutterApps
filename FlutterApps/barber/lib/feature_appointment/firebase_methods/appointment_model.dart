import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String barbero;
  final String cliente;
  final bool diaDisponible;
  final String fecha;
  final String hora;
  final bool horaDisponible;
  final String tipoServicio;

  Appointment(
      {required this.barbero,
      required this.cliente,
      required this.diaDisponible,
      required this.fecha,
      required this.hora,
      required this.horaDisponible,
      required this.tipoServicio});

  /*factory Appointment.(Map<String, dynamic> data) {
    return Appointment(
        barbero: data['Barbero'],
        cliente: data['Cliente'],
        diaDisponible: data['DiaDisponible'],
        fecha: data['Fecha'],
        hora: data['Hora'],
        horaDisponible: data['HoraDisponible'],
        tipoServicio: data['TipoServicio']);
  }*/

}
