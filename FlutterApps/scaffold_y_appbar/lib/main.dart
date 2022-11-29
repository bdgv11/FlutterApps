import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Scaffold App - Andamiaje',
      home: MyHomePage(title: 'ScaffoldApp Home'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, this.title}):super(key:key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _corazon_liked = true;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: (){_liked();},
              icon: _corazon)
        ],
      ),
    );
  }

  _liked(){
    setState((){
      if(_corazon_liked){
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _corazon_liked = false;
      }else{
        _corazon = Icon(Icons.favorite, color: Colors.red);
        _corazon_liked = true;
      }
    });
  }
}