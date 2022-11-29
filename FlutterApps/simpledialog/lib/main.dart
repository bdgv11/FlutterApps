import 'package:flutter/foundation.dart';
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
            Padding(padding: EdgeInsets.all(20)),
            const Text(
              'La eleccion es: ',
              style: TextStyle(color: Colors.indigo, fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Text(
              '$_opcion',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

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
                  children: const [
                    Icon(Icons.directions_car),
                    Text(' Auto')
                  ],
                ),
                  onPressed: (){
                    Navigator.pop(context, listaOpciones.Auto);
                  }
              ),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.airplanemode_on),
                    Text(' Avion')
                  ],
                ),
                  onPressed: (){
                    Navigator.pop(context, listaOpciones.Avion);
                  }
              ),
              SimpleDialogOption(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.directions_boat),
                    Text(' Barco')
                  ],
                ),
                onPressed: (){
                  Navigator.pop(context, listaOpciones.Barco);
                },
              )
            ],
          );
        }))
    {
      case listaOpciones.Auto:
        opcionElegida('Auto');
        break;

      case listaOpciones.Avion:
        opcionElegida('Avion');
        break;

      case listaOpciones.Barco:
        opcionElegida('Barco');
        break;
    }
  }

  void opcionElegida(String opcion){
    setState(() {
      _opcion = opcion;
    });
  }
}


enum listaOpciones { Auto, Avion, Barco }
