import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statefull App',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  String title = 'Color App';
  Color color = Colors.red;

  State createState() {
    return _MyHome();
  }
}

class _MyHome extends State<MyHome> {
  int _red = 0;
  int _blue = 0;
  int _green = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('El color actual es: '),
            Container(
              color: widget.color,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              child: Text(
                  'R (${widget.color.red}) G (${widget.color.green}) B (${widget.color.blue})'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarColor,
        backgroundColor: widget.color,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _cambiarColor() {
    setState(() {
      _red = Random.secure().nextInt(256);
      _blue = Random.secure().nextInt(256);
      _green = Random.secure().nextInt(256);

      widget.color = Color.fromRGBO(_red, _green, _blue, 0.5);
    });
  }
}
