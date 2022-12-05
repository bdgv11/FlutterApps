import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenguajesprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajesprogramacion/widgets/languaje_item_widget.dart';

class LenguagesList extends StatelessWidget {
  /// It returns a stream of snapshots of the collection 'lenguajes' ordered by the field 'votos'
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection('lenguajes')
      .orderBy('votos', descending: true)
      .snapshots();

  /// A constructor.
  const LenguagesList();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getStream(),
      builder: (context, languajes) {
        if (languajes.hasError) {
          return ConnectionError();
        }
        if (languajes.hasData) {
          final data = languajes.data;

          if (data != null) {
            return ListView.builder(
              itemExtent: 80,
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return LanguajeItem(data.docs[index]);
              },
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
