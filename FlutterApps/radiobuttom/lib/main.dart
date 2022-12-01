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
      title: 'Switch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Switch'),
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
  bool _opcion = false;
  RadioOpciones _opcionRadio = RadioOpciones.Avion;
  Icon _iconOpcionRadio = Icon(Icons.airplanemode_active);

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
            const Text(
              'Selecciona la opcion',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(
              'Switch',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _opcion,
                  activeColor: Colors.green,
                  activeTrackColor: Colors.amber,
                  inactiveTrackColor: Colors.red[100],
                  inactiveThumbColor: Colors.red,
                  onChanged: (value) {
                    setState(() {
                      _opcion = value;
                    });
                  },
                ),
                CupertinoSwitch(
                  value: _opcion,
                  activeColor: Colors.blue,
                  trackColor: Colors.amber,
                  thumbColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      _opcion = value;
                    });
                  },
                )
              ],
            ),
            Text(_opcion ? 'Activado' : 'Desactivado'),
            const Divider(),
            const Text(
              'Radio',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Automovil',
                  style: RadioOpciones.Auto == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Auto,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Auto;
                      _iconOpcionRadio = Icon(Icons.directions_car);
                    });
                  },
                ),
                Text(
                  'Barco',
                  style: RadioOpciones.Barco == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Barco,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Barco;
                      _iconOpcionRadio = Icon(Icons.directions_boat);
                    });
                  },
                ),
                Text(
                  'Avion',
                  style: RadioOpciones.Avion == _opcionRadio
                      ? TextStyle(color: Colors.green)
                      : TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Avion,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Avion;
                      _iconOpcionRadio = Icon(Icons.airplanemode_active_sharp);
                    });
                  },
                )
              ],
            ),
            _iconOpcionRadio,
          ],
        ),
      ),
    );
  }
}

enum RadioOpciones { Auto, Avion, Barco }
