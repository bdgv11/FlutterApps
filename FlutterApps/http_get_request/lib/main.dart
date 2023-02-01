import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/item_request.dart';
import 'package:http_get_request/widgets/request_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final request =
      const RequestItem(url: 'https://jsonplaceholder.typicode.com/posts/10');
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HTTP Get Request'),
        ),
        body: Center(
          child: HTTPWidget(request),
        ),
      ),
    );
  }
}
