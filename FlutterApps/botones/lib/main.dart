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
      home: const MyHomePage(title: '--Botones--'),
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

  String botonPulsado = 'Ninguno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Botones'
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El boton pulsado es: '),
            Text(
              '$botonPulsado',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: _elevatedButtonPulsado,
                child: Text('Elevated Button'),
              style: ElevatedButton.styleFrom(
                  elevation: 30,
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.amberAccent
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            TextButton(
                onPressed: _textButtonPulsado,
                child: Text('Text Buttom'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
            ),
            Padding(padding: EdgeInsets.all(8)),
            IconButton(onPressed: _iconButtomPulsado,
                icon: Icon(Icons.accessibility_new),
                color: Colors.blue,
                iconSize: 30,
            ),
            Ink(
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.lightBlue
              ),
              child: IconButton(onPressed: _iconButtomPulsado,
                  icon: Icon(Icons.accessibility_new),
                color: Colors.white,
                iconSize: 30,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            OutlinedButton(onPressed: _outlineButtom, 
                child: Text(
                    'Outline Buttom',
                  style: TextStyle(
                    color: Colors.purple
                  ),
                ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Colors.purple,
                  style: BorderStyle.solid
                )
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            CupertinoButton(
                child: Text('Cupertino Button'),
                onPressed: _cupertinoButton,
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(50),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _floatingPulsado,
        tooltip: 'Pulsar',
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _floatingPulsado(){
    _queBoton('flo');
  }

  void _queBoton(String boton){
    setState(() {
      switch(boton){
        case 'flo':
          botonPulsado = 'Floating action';
          break;
        case 'ele':
          botonPulsado = 'Elevated Buttom';
          break;
        case 'text':
          botonPulsado = 'Text Buttom pulsado';
          break;
        case 'icon':
          botonPulsado = 'Icon Buttom pulsado';
          break;
        case 'out':
          botonPulsado = 'Outline Buttom pulsado';
          break;
        case 'cup':
          botonPulsado = 'Cupertino Buttom pulsado';
          break;
      }
    });
  }

  void _elevatedButtonPulsado(){
    _queBoton('ele');
  }

  void _textButtonPulsado(){
    _queBoton('text');
  }

  void _iconButtomPulsado(){
    _queBoton('icon');
  }

  void _outlineButtom(){
    _queBoton('out');
  }

  void _cupertinoButton(){
    _queBoton('cup');
  }
}