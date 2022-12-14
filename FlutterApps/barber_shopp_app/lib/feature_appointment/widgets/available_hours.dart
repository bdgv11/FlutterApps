import 'package:barber_shopp_app/feature_appointment/firebase_methods/collections_methods.dart';
import 'package:barber_shopp_app/feature_appointment/widgets/hours_buttoms_widget.dart';
import 'package:barber_shopp_app/firebase/connection_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AvailableHours extends StatelessWidget {
  AvailableHours({
    Key? key,
    required this.barberoSeleccionado,
    required User user,
    required this.today,
    required this.servicioSeleccionado,
  })  : _user = user,
        super(key: key);

  final String barberoSeleccionado;
  final User _user;
  final DateTime today;
  final String servicioSeleccionado;
  late bool _flag = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        //ERROR
        if (snapshot.hasError) {
          return const ConnectionError();
        }
        //CONNECTED BUT WITHOUT DATA
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData == false) {
          //ADD HOURS TO FIREBASE COLLECTION 'CITA'
          CollectionMethods().addHours(barberoSeleccionado, _user.displayName!,
              today, servicioSeleccionado);
        }

        // CONNECTED WITH DATA
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          /// Checking if the barberoSeleccionado, _user.displayName and
          /// servicioSeleccionado are not empty.
          if (barberoSeleccionado.isNotEmpty &&
              _user.displayName!.isNotEmpty &&
              servicioSeleccionado.isNotEmpty) {
            getD();

            if (_flag) {
              print('No voy a agregar mas!');
            } else {
              CollectionMethods().addHours(barberoSeleccionado,
                  _user.displayName!, today, servicioSeleccionado);
              print("INFO AGREGADA");
              _flag = true;
            }
          }

          return Container(
            alignment: Alignment.center,
            child: SizedBox(height: 300, child: HorasWidget()),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  void getD() async {
    String fecha = "${today.day}/${today.month}/${today.year}";

    var snap = await FirebaseFirestore.instance
        .collection('Cita')
        .where('Fecha', isEqualTo: fecha)
        .where('Barbero', isEqualTo: barberoSeleccionado)
        .get();

    if (snap.docs.length > 1) {
      _flag = true;
      print('Hay mas de 1 linea...');
    }
  }
}
