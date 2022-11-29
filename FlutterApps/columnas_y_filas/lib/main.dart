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
      home: const MyHomePage(title: 'Filas y columnas'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment
                .start, // la primera columna tiene todo su contenido ordenado
            children: [
              Icon(Icons.home, color: Colors.amber),
              Icon(Icons.supervised_user_circle, color: Colors.amber),
              Icon(Icons.card_travel, color: Colors.amber),
              Icon(Icons.shop_2_rounded, color: Colors.amber),
              Icon(Icons.ice_skating, color: Colors.amber)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // la primera columna tiene todo su contenido ordenado
            children: [
              Icon(Icons.home, color: Colors.purple),
              Icon(Icons.supervised_user_circle, color: Colors.purple),
              Icon(Icons.card_travel, color: Colors.purple),
              Icon(Icons.shop_2_rounded, color: Colors.purple),
              Icon(Icons.ice_skating, color: Colors.purple)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .end, // la primera columna tiene todo su contenido ordenado
            children: [
              Icon(Icons.home, color: Colors.green),
              Icon(Icons.supervised_user_circle, color: Colors.green),
              Icon(Icons.card_travel, color: Colors.green),
              Icon(Icons.shop_2_rounded, color: Colors.green),
              Icon(Icons.ice_skating, color: Colors.green)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // divide el espacio con el margen
            children: [
              Icon(Icons.home, color: Colors.blue),
              Icon(Icons.supervised_user_circle, color: Colors.blue),
              Icon(Icons.card_travel, color: Colors.blue),
              Icon(Icons.shop_2_rounded, color: Colors.blue),
              Icon(Icons.ice_skating, color: Colors.blue)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, // tienen las mismas distancia entre ellos pero deja un poco menos enel margen
            children: [
              Icon(Icons.home, color: Colors.red),
              Icon(Icons.supervised_user_circle, color: Colors.red),
              Icon(Icons.card_travel, color: Colors.red),
              Icon(Icons.shop_2_rounded, color: Colors.red),
              Icon(Icons.ice_skating, color: Colors.red)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // no deja espacio ninguno con los margenes
            children: [
              Icon(Icons.home, color: Colors.black26),
              Icon(Icons.supervised_user_circle, color: Colors.black26),
              Icon(Icons.card_travel, color: Colors.black26),
              Icon(Icons.shop_2_rounded, color: Colors.black26),
              Icon(Icons.ice_skating, color: Colors.black26)
            ],
          )
        ],
      ),
    );
  }
}
