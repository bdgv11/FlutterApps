import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'ScaffoldApp Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _corazon_liked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
              onPressed: () {
                _liked();
              },
              icon: _corazon)
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: const [
            DrawerHeader(
                child: Text(
              'Menu Drawer',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            )),
            Text('Enlace 1'),
            Text('Enlace 2'),
            Text('Enlace 3')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _liked();
        },
        backgroundColor: Colors.greenAccent,
        child: _corazon,
        //label: Text('Like!'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //Esto acomoda con el mismo espacio a los iconos
            children: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.camera_alt_rounded),
                  color: Colors.white),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.phone_callback),
                  color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }

  _liked() {
    setState(() {
      if (_corazon_liked) {
        _corazon = Icon(Icons.favorite_border, color: Colors.white);
        _corazon_liked = false;
      } else {
        _corazon = Icon(Icons.favorite, color: Colors.white);
        _corazon_liked = true;
      }
    });
  }
}
