import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fecha y Hora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fecha y Hora'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('es', 'ES')],
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
  var _date = null;
  var _time = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _seleccionarFecha,
              child: const Text('Introducir FECHA de nacimiento'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  textStyle: const TextStyle(color: Colors.white)),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: _seleccionarHora,
              child: const Text('Introducir HORA de nacimiento'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(color: Colors.white)),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('La fecha seleccionada es: '),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              _date == null
                  ? 'Ninguna fecha seleccionada'
                  : '${_date.day}/${_date.month}/${_date.year}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('La HORA seleccionada es: '),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              _time == null
                  ? 'Ninguna hora seleccionada'
                  : '${_time.hour}:${_time.minute}', // '${_time.format(context)}' // Este tambien sirve
              style: _time == null
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Future _seleccionarFecha() async {
    DateTime? _fechaSeleccionada = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    setState(() {
      if (_fechaSeleccionada != null) {
        _date = _fechaSeleccionada;
      }
    });
  }

  Future _seleccionarHora() async {
    TimeOfDay? _horaSeleccionada =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    setState(() {
      if (_horaSeleccionada != null) {
        _time = _horaSeleccionada;
      }
    });
  }
}
