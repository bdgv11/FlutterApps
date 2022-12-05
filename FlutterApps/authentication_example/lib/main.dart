import 'package:authentication_example/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
