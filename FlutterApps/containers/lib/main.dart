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
      title: 'Flutter Demo',
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
      home: const MyHomePage(title: 'Containers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
            Container(
              child: Text('Contnedor 1'),
              color: Colors.blue,
              margin: EdgeInsets.only(bottom: 30),
            ),
            Container(
              child: Text('Contnedor 2'),
              color: Colors.lightGreen,
              margin: EdgeInsets.only(bottom: 30),
              height: 40,
              width: 40,
            ),
            Container(
              child: Text('Contnedor 3'),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.greenAccent),
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(40),
            ),
            Container(
              child: Text(
                'Contenedor 4 con un texto largo asi se agarra al tamano a pesar del tamano del texto..',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 2, style: BorderStyle.solid),
                shape: BoxShape.rectangle,
                color: Colors.purple,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              margin: EdgeInsets.all(40),
              padding: EdgeInsets.all(8),
            ),
            Container(
              color: Colors.black12,
              child: Icon(
                Icons.car_rental,
                color: Colors.grey,
              ),
              height: 70,
              width: 70,
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment
                  .bottomCenter, // se posiciona abajo en el centro el icono
            ),
            Container(
                color: Colors.black12,
                child: Icon(
                  Icons.car_rental,
                  color: Colors.grey,
                ),
                height: 70,
                width: 70,
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment(-0.8, 0.9))
          ],
        ),
      ),
    );
  }
}
