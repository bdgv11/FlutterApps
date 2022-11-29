import 'package:flutter/material.dart';
import 'package:navigation/pantalla_3.dart';
import 'package:navigation/pantalla_dos.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pantalla 1'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) =>
            const MyHomePage(title: 'Pagina 1'),
        '/route2': (BuildContext context) => const Pantalla2(title: 'Pagina 2'),
        '/route3': (BuildContext context) => const Pantalla3(title: 'Pagina 3')
      },
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
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route2');
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Pantalla2(
                              title: 'Pantalla 2',
                            )));*/
              },
              child: const Text('Ir a pantalla 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route3');
              },
              child: const Text('Ir a pantalla 3'),
            )
          ],
        ),
      ),
    );
  }
}
