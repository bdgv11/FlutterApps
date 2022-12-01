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
  Icon _iconOpcionRadio = const Icon(Icons.airplanemode_active);

  Map _opcionesCheckbox = {
    RadioOpciones.Auto: false,
    RadioOpciones.Avion: false,
    RadioOpciones.Barco: false
  };

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
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(
              'Switch',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Automovil',
                  style: RadioOpciones.Auto == _opcionRadio
                      ? const TextStyle(color: Colors.green)
                      : const TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Auto,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Auto;
                      _iconOpcionRadio = const Icon(Icons.directions_car);
                    });
                  },
                ),
                Text(
                  'Barco',
                  style: RadioOpciones.Barco == _opcionRadio
                      ? const TextStyle(color: Colors.green)
                      : const TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Barco,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Barco;
                      _iconOpcionRadio = const Icon(Icons.directions_boat);
                    });
                  },
                ),
                Text(
                  'Avion',
                  style: RadioOpciones.Avion == _opcionRadio
                      ? const TextStyle(color: Colors.green)
                      : const TextStyle(),
                ),
                Radio(
                  value: RadioOpciones.Avion,
                  groupValue: _opcionRadio,
                  onChanged: (value) {
                    setState(() {
                      _opcionRadio = RadioOpciones.Avion;
                      _iconOpcionRadio =
                          const Icon(Icons.airplanemode_active_sharp);
                    });
                  },
                )
              ],
            ),
            _iconOpcionRadio,
            const Divider(),
            const Text(
              'Checkbox',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  activeColor: Colors.green,
                  value: _opcionesCheckbox[RadioOpciones.Auto],
                  onChanged: (value) {
                    setState(() {
                      _opcionesCheckbox[RadioOpciones.Auto] = value;
                    });
                  },
                ),
                Text('Auto',
                    style: _opcionesCheckbox[RadioOpciones.Auto]
                        ? TextStyle(color: Colors.green)
                        : TextStyle()),
                Checkbox(
                  activeColor: Colors.green,
                  value: _opcionesCheckbox[RadioOpciones.Barco],
                  onChanged: (value) {
                    setState(() {
                      _opcionesCheckbox[RadioOpciones.Barco] = value;
                    });
                  },
                ),
                Text('Barco',
                    style: _opcionesCheckbox[RadioOpciones.Barco]
                        ? TextStyle(color: Colors.green)
                        : TextStyle()),
                Checkbox(
                  activeColor: Colors.green,
                  value: _opcionesCheckbox[RadioOpciones.Avion],
                  onChanged: (value) {
                    setState(() {
                      _opcionesCheckbox[RadioOpciones.Avion] = value;
                    });
                  },
                ),
                Text('Avion',
                    style: _opcionesCheckbox[RadioOpciones.Avion]
                        ? TextStyle(color: Colors.green)
                        : TextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.directions_car,
                  color: _opcionesCheckbox[RadioOpciones.Auto]
                      ? Colors.green
                      : Colors.grey,
                ),
                Icon(
                  Icons.directions_boat,
                  color: _opcionesCheckbox[RadioOpciones.Barco]
                      ? Colors.green
                      : Colors.grey,
                ),
                Icon(
                  Icons.airplanemode_active,
                  color: _opcionesCheckbox[RadioOpciones.Avion]
                      ? Colors.green
                      : Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum RadioOpciones { Auto, Avion, Barco }
