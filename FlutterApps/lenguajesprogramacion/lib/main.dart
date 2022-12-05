import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenguajesprogramacion/widgets/connection_error_widget.dart';
import 'package:lenguajesprogramacion/widgets/customFloatingActionButton.dart';
import 'package:lenguajesprogramacion/widgets/lenguages_list_view.dart';

void main() {
  runApp(LanguagesProgramacion());
}

class LanguagesProgramacion extends StatelessWidget {
  late final Future<FirebaseApp> _initialization;

  /*@override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Lenguajes de Programacion'),
              ),
              body: ConnectionError(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Lenguajes de Programacion'),
              ),
              body: LenguagesList(),
              floatingActionButton: CustomFloatingActionButton(),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
