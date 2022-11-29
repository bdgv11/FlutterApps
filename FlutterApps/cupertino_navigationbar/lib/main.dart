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
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: const [
            Text(
              'Aplicacion para barra de navegacion',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black26),
            )
          ],
        ),
      ),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        middle: Text(
          'Titulo de Pagina',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
    );
  }
}
