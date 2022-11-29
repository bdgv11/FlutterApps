import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key, required this.title});

  final String title;

  @override
  State<Pantalla3> createState() => _PantallaTresState();
}

class _PantallaTresState extends State<Pantalla3> {

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
              child: const Text('Volver a pantalla 1'
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/route2');
              },
              child: const Text('Volver a pantalla 2'
              ),
            )
          ],
        ),
      ),
    );
  }
}