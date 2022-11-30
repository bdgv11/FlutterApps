import 'package:flutter/cupertino.dart';
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
      title: 'Fecha y Hora CUPERTINO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fecha y Hora CUPERTINO'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
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
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: _displayCalendar(),
                        height: MediaQuery.of(context).size.height / 3,
                      );
                    });
              },
              child: const Text('Introducir FECHA de nacimiento'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('La fecha seleccionada es: '),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              _date == null
                  ? 'Ninguna fecha seleccionada'
                  : '${_date.day}/${_date.month}/${_date.year}',
              style: _date == null
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: _displayTime(),
                        height: MediaQuery.of(context).size.height / 3,
                      );
                    });
              },
              child: const Text('Introducir Hora de nacimiento'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('La HORA seleccionada es: '),
            const Padding(padding: EdgeInsets.all(10)),
            Text(
              _time == null
                  ? 'Ninguna hora seleccionada'
                  : '${_time.hour}:${_time.minute}',
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

  Widget _displayCalendar() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      minimumDate: DateTime(1990),
      maximumDate: DateTime.now(),
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (value) {
        setState(() {
          _date = value;
        });
      },
    );
  }

  Widget _displayTime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      minimumDate: DateTime(1990),
      maximumDate: DateTime.now(),
      mode: CupertinoDatePickerMode.time,
      onDateTimeChanged: (value) {
        setState(() {
          _time = value;
        });
      },
    );
  }
}
