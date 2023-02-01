import 'package:animaciones_implicitas/widgets/increment_widget.dart';
import 'package:animaciones_implicitas/widgets/text_style_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/contador_providers.dart';

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
      home: ChangeNotifierProvider(
        create: (_) => ContadorProvider(20),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('App animated container'),
          ),
          body: const Center(
            child: AnimatedTextStyleWidget(),
          ),
          floatingActionButton: const IncrementWidget(),
        ),
      ),
    );
  }
}
