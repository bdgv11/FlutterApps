import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: const MyHomePage(title: 'Textos'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Material Icon',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  Icons.home,
                  color: Colors.purple,
                  size: 30,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Cupertino Icon',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Icon(
                  CupertinoIcons.home,
                  color: Colors.indigo,
                  size: 30,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Font Awesome Icon',
                  style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.lightGreen,
                  size: 30,
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Assets/Imagenes/flutter.png',
                  width: 100,
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://res.cloudinary.com/nitishk72/image/upload/v1586796259/nstack_in/courses/flutter/flutter-banner.png',
                  width: 150,
                )
              ],
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 1.2, //Ancho de la pantalla dividido para sacar una parte del ancho
              color: Colors.black,
              child: const Text(
                'Este es un ejemplo de texto',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Fruktur'
                ),
                textAlign: TextAlign.left,
                // overflow: TextOverflow.clip, // este corta el texto cuando el container pasa el tama;o
                // overflow: TextOverflow.ellipsis, // muestra un '...' cuando ya no tiene espacio y corta el texto
                // overflow: TextOverflow.fade, // se pone borrosa la parte que no entra en el contenedor
                overflow: TextOverflow.visible, // no importa como se tiene que ver jaja xD
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              'Texto con Flutter package',
                style: GoogleFonts.pacifico(
                  color: Colors.deepOrangeAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
            )
          ],
        ),
      ),
    );
  }
}