import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/base_request.dart';
import 'package:http_get_request/models/item.dart';
import 'package:http_get_request/widgets/error_widget.dart';
import 'package:http_get_request/widgets/success_widget.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPRequest<Item> _request;
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<Item> futureItem;

  @override
  initState() {
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureItem,
      builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
        if (snapshot.hasError) {
          return ErrorItemWidget();
        }
        if (snapshot.hasData) {
          return SuccessWidget(snapshot.data);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
