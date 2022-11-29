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
  int _itemSeleccionado = 0;
  String textoAVisualizar = 'Index 0 : Home';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textoAVisualizar,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _liked();
          },
          backgroundColor: Colors.greenAccent,
          icon: _corazon,
          label: const Text('Like!')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, color: Colors.white),
              label: 'My Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment, color: Colors.white),
              label: 'Stats'),
        ],
        currentIndex: _itemSeleccionado,
        onTap: _itemPulsado,
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

  void _itemPulsado(int index) {
    setState(() {
      _itemSeleccionado = index;
      switch (_itemSeleccionado) {
        case 0:
          textoAVisualizar = '$_itemSeleccionado : Home';
          break;
        case 1:
          textoAVisualizar = '$_itemSeleccionado : My Account';
          break;
        case 2:
          textoAVisualizar = '$_itemSeleccionado : Stats';
          break;
      }
    });
  }
}
