import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key, required this.title});

  final String title;

  @override
  State<Pantalla2> createState() => _PantallaDosState();
}

class _PantallaDosState extends State<Pantalla2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/route1');
              },
              child: const Text('Ir a la pantalla 1'
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/route3');
              },
              child: const Text('Ir a la pantalla 3'
              ),
            )
          ],
        ),
      ),
    );
  }
}