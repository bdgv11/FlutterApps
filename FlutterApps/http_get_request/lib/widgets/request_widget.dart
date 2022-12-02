import 'package:flutter/material.dart';
import 'package:http_get_request/helpers/base_request.dart';
import 'package:http_get_request/models/item.dart';

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
          Text('Error en los datos');
        } else if (snapshot.hasData) {
          Item? item = snapshot.data;
          if (item != null) {
            Text('${item.id} - ${item.title}');
          }
        } else {
          return Text('No hay nada para mostrar');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
