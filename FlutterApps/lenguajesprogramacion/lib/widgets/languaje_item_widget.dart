import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LanguajeItem extends StatelessWidget {
  final String nombre;
  final int votos;
  final String imagen;
  final QueryDocumentSnapshot _snapshot;

  LanguajeItem(this._snapshot)
      : nombre = _snapshot.get('nombre') as String,
        votos = _snapshot.get('votos') as int,
        imagen = _snapshot.get('imagen') as String;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/Images/$imagen'),
      title: Text('$nombre'),
      subtitle: Text('El numero de votos es: ${votos}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.thumb_up),
            iconSize: 20,
            color: Colors.blue,
            onPressed: _addVoto,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Seguro que quieres borrar ${nombre} ??'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          _removeLanguage();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Borrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
            iconSize: 20,
          ),
        ],
      ),
    );
  }

  void _addVoto() {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      final secureSnapshot = await transaction.get(_snapshot.reference);

      final currentVotos = secureSnapshot.get('votos') as int;

      transaction.update(secureSnapshot.reference, {"votos": currentVotos + 1});
    });
  }

  void _removeLanguage() {
    FirebaseFirestore.instance
        .collection('lenguajes')
        .doc(_snapshot.id)
        .delete();
  }

  void _updateLanguage() {
    FirebaseFirestore.instance
        .collection('lenguajes')
        .doc(_snapshot.id)
        .update({'nombre': 'UpdateTest1'});
  }
}
