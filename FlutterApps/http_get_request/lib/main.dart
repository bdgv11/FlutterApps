import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/item_request.dart';
import 'package:http_get_request/widgets/request_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final request =
      const RequestItem(url: 'https://jsonplaceholder.typicode.com/posts/1');
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTTP Get Request'),
        ),
        body: Center(
          child: HTTPWidget(request),
        ),
      ),
    );
  }
}
