import 'package:flutter/cupertino.dart';
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle, color: Colors.white),
              label: 'My Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.white),
              label: 'Estadisticas')
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [
                      Text('$index: Inicio'),
                    ],
                  ),
                ),
              );
            });

          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [
                      Text('$index: My Account'),
                    ],
                  ),
                ),
              );
            });

          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [
                      Text('$index: Stats'),
                    ],
                  ),
                ),
              );
            });

          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [
                      Text('$index: Stats'),
                    ],
                  ),
                ),
              );
            });
        }
      },
    );
  }
}
