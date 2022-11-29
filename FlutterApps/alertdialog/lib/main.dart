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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Alert Dialog'),
      debugShowCheckedModeBanner: false,
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
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible:
                        false, // ESTA ES LA LINEA PARA EVITAR QUE TOCANDO A LOS LADOS SE CIERRE EL MSJ
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Titulo del Alert Dialog'),
                        content: Text('Contenido del alert dialog'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'))
                        ],
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white)),
              child: Text('Abrir Dialog'),
            ),

            //VISTA CUPERTINO
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return CupertinoAlertDialog(
                        title: Text('Titulo del Alert Dialog'),
                        content: Text('Contenido del alert dialog'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'))
                        ],
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.black)),
              child: Text('Abrir cupertino dialog'),
            )
          ],
        ),
      ),
    );
  }
}
