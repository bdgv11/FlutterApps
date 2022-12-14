import 'package:barber_shopp_app/feature_appointment/widgets/hour_item.dart';
import 'package:barber_shopp_app/firebase/connection_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorasWidget extends StatelessWidget {
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection("Cita")
      .where("Fecha", isEqualTo: "12/12/2022")
      .orderBy('Hora', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
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
}
