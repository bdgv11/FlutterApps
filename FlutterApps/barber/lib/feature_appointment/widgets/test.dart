import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestStreamWidget extends StatelessWidget {
  final String barbero;
  final String cliente;
  final String fecha;
  final String hora;
  final bool horaDisponible;
  final String tipoServicio;
  final QueryDocumentSnapshot _snapshot;

  TestStreamWidget(this._snapshot)
      : barbero = _snapshot.get('Barbero') as String,
        cliente = _snapshot.get('Cliente') as String,
        fecha = _snapshot.get('Fecha') as String,
        hora = _snapshot.get('Hora') as String,
        horaDisponible = _snapshot.get('HoraDisponible') as bool,
        tipoServicio = _snapshot.get('TipoServicio') as String;

  Stream<QuerySnapshot> getHours(BuildContext context) async* {
    /// `yield` is a keyword that is used in conjunction with `async*` and `sync*` to mark a function as
    /// a generator.
    yield* FirebaseFirestore.instance
        .collection('Cita')
        .where('Fecha', isEqualTo: fecha)
        .where('Barbero', isEqualTo: cliente)
        .orderBy('Hora', descending: false)
        .snapshots();
  }

  late String _hora;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getHours(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;

          if (data != null) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                //return HourItem(data.docs[index]);
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
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Barlow'),
                    ),
                  ),
                );
              },
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
