import 'package:barber_shopp_app/feature_appointment/firebase_methods/collections_methods.dart';
import 'package:barber_shopp_app/feature_appointment/widgets/hour_item.dart';
import 'package:barber_shopp_app/firebase/connection_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorasWidget extends StatelessWidget {
  HorasWidget({
    Key? key,
    required this.barberoSeleccionado,
    required this.fecha,
    required this.servicioSeleccionado,
  }) : super(key: key);

  final String barberoSeleccionado;
  final String fecha;
  final String servicioSeleccionado;

  Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection("Cita")
      .where('Fecha', isEqualTo: fecha)
      .where('Barbero', isEqualTo: barberoSeleccionado)
      .orderBy('Hora', descending: false)
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
                return HourItem(data.docs[index]);
              },
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }

  getInfo() async {
    try {
      await FirebaseFirestore.instance
          .collection("Cita")
          .where('Fecha', isEqualTo: fecha)
          .where('Barbero', isEqualTo: barberoSeleccionado)
          .orderBy('Hora', descending: false)
          .get();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
