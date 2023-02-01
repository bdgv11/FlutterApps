import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dialog App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _opcion = 'ninguno';
  String _botonPulsado = 'ninguno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
                onPressed: _elegirOpcion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.black),
                ),
                child: const Text('Abrir simple dialog')),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
                onPressed: _elegirOpcionBottomSheet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Abrir el ButtomSheet')),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(
                onPressed: _elegirActionSheetOpcion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                child: const Text('Abrir cupertino')),
            Padding(padding: EdgeInsets.all(15)),
            Text(
              'La seleccion de $_botonPulsado es: ',
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            Text(
              '$_opcion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  //Simple Dialog
  Future<void> _elegirOpcion() async {
    switch (await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Seleccionar una opcion de transporte'),
            children: [
              SimpleDialogOption(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Icon(Icons.directions_car), Text(' Auto')],
                  ),
                  onPressed: () {
                    Navigator.pop(context, listaOpciones.Auto);
                  }),
              SimpleDialogOption(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.airplanemode_on),
                      Text(' Avion')
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context, listaOpciones.Avion);
                  }),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(Icons.directions_boat), Text(' Barco')],
                ),
                onPressed: () {
                  Navigator.pop(context, listaOpciones.Barco);
                },
              )
            ],
          );
        })) {
      case listaOpciones.Auto:
        opcionElegida('Auto', 0);
        break;

      case listaOpciones.Avion:
        opcionElegida('Avion', 0);
        break;

      case listaOpciones.Barco:
        opcionElegida('Barco', 0);
        break;
    }
  }

  void opcionElegida(String opcion, int identificador) {
    setState(() {
      switch (identificador) {
        case 0:
          _botonPulsado = 'Simple Dialog';
          break;

        case 1:
          _botonPulsado = 'Bottom Sheet';
          break;

        case 2:
          _botonPulsado = 'Cupertino Sheet';
          break;
      }
      _opcion = opcion;
    });
  }

  // Bottom sheet
  Future<void> _elegirOpcionBottomSheet() async {
    switch (await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Seleccione una opcion: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Divider(),
                SimpleDialogOption(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.directions_car),
                        Text(' Auto')
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context, listaOpciones.Auto);
                    }),
                Divider(),
                SimpleDialogOption(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.airplanemode_on),
                        Text(' Avion')
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context, listaOpciones.Avion);
                    }),
                Divider(),
                SimpleDialogOption(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.directions_boat),
                      Text(' Barco')
                    ],
                  ),
                  onPressed: () {
                    Navigator.pop(context, listaOpciones.Barco);
                  },
                ),
                Divider(),
              ],
            ),
          );
        })) {
      case listaOpciones.Auto:
        opcionElegida('Auto', 1);
        break;

      case listaOpciones.Avion:
        opcionElegida('Avion', 1);
        break;

      case listaOpciones.Barco:
        opcionElegida('Barco', 1);
        break;
    }
  }

  // Cupertino Dialog
  Future<void> _elegirActionSheetOpcion() async {
    switch (await showCupertinoModalPopup(
        //barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('Elige una opcion'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, listaOpciones.Auto);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(Icons.car_rental), Text(' Auto')],
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, listaOpciones.Avion);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(Icons.airplanemode_on), Text(' Avion')],
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context, listaOpciones.Barco);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(Icons.directions_boat), Text(' Barco')],
                ),
              )
            ],
          );
        })) {
      case listaOpciones.Auto:
        opcionElegida('Auto', 2);
        break;

      case listaOpciones.Avion:
        opcionElegida('Avion', 2);
        break;

      case listaOpciones.Barco:
        opcionElegida('Barco', 2);
        break;
    }
  }
}

enum listaOpciones { Auto, Avion, Barco }
