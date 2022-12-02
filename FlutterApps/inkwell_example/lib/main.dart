import 'dart:html';

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
        title: 'Comidas App',
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
        home: const MyHomePage(title: 'Comidas App Home'),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _comidas.length,
        itemBuilder: (context, index) {
          final item = _comidas[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(item.nombre),
            background: Container(
              color: Colors.cyan,
              child: const Icon(
                Icons.delete_outline,
                size: 40,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                _comidas.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text(
                      '${item.nombre} ha sido borrado',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              });
            },
            child: Card(
              color: Colors.grey[100],
              shadowColor: Colors.purple,
              elevation: 5,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green,
                        blurRadius: 10,
                        offset: Offset(-15, 5)),
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.cyan[100]!, Colors.cyan[600]!]),
                ),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${item.nombre}',
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        '${item.categoria}',
                        style: const TextStyle(color: Colors.indigo),
                      )
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text(
                            '${item.nombre}',
                            style: const TextStyle(
                              color: Colors.cyan,
                            ),
                          ),
                          content: item.image,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
