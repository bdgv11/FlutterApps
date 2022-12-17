import 'package:barber/feature_appointment/widgets/hour_item.dart';
import 'package:barber/firebase/connection_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorasWidget extends StatelessWidget {
  HorasWidget(
      {required this.barberoSeleccionado,
      required this.fecha,
      required this.servicioSeleccionado,
      required this.clienteDesdeSeleccionDeCita,
      required this.servicioDesdeSeleccionDeCita});

  String barberoSeleccionado;
  String fecha;
  String servicioSeleccionado;
  String clienteDesdeSeleccionDeCita;
  String servicioDesdeSeleccionDeCita;

  Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection("Cita")
      .where('Fecha', isEqualTo: fecha)
      .where('Barbero', isEqualTo: barberoSeleccionado)
      .where('HoraDisponible', isEqualTo: true)
      .orderBy('Hora', descending: false)
      .limit(9)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return StreamBuilder(
      stream: getStream(),
      builder: (context, horas) {
        if (horas.hasError) {
          return ConnectionError();
        }
        if (horas.hasData) {
          final data = horas.data;

          if (data != null) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return HourItem(data.docs[index], clienteDesdeSeleccionDeCita,
                    servicioDesdeSeleccionDeCita);
              },
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
