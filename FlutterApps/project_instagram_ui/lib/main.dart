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
      home: const MyHomePage(title: 'Instagram'),
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
        backgroundColor: Colors.white,
        //LEADING
        leadingWidth: 10,
        //TITLE,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),

        //ACTIONS
        actions: const [
          Icon(
            Icons.add_box_outlined,
            color: Colors.black,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Icon(
            Icons.sms_outlined,
            color: Colors.black,
          ),
          Padding(padding: EdgeInsets.all(5)),
        ],
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          children: const [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined, color: Colors.black),
              label: 'My Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_outlined, color: Colors.black),
              label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
              label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined, color: Colors.black),
              label: 'Stats'),
        ],
      ),
    );
  }
}
