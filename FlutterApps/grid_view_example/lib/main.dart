import 'package:flutter/material.dart';

import 'comidas.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List _comidas = [
    Comida('Ensalada 1', 'Entrante', Image.asset('Assets/Images/Imagen1.jpeg')),
    Comida('Buffet', 'Entrante', Image.asset('Assets/Images/Imagen2.jpeg')),
    Comida('Carne', 'Entrante', Image.asset('Assets/Images/Imagen3.jpeg')),
    Comida('Variado', 'Entrante', Image.asset('Assets/Images/Imagen4.jpeg')),
    Comida('Pollo', 'Entrante', Image.asset('Assets/Images/Imagen5.jpeg')),
    Comida('Helado', 'Entrante', Image.asset('Assets/Images/Imagen6.jpeg')),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: _comidas.length,
          itemBuilder: (context, index) {
            final item = _comidas.elementAt(index);
            return Card(
              color: Colors.cyan,
              elevation: 5,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('${item.nombre}')));
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        child: item.image,
                      ),
                      const Divider(color: Colors.white),
                      Text(
                        '${item.nombre}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${item.categoria}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
            /*return GridTileBar(
              backgroundColor: Colors.cyan,
              title: Text(
                '${item.nombre}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 8),
                child: item.image,
              ),
            );*/
          }),
    );
  }
}
