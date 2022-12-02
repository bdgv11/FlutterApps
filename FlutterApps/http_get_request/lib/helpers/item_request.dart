// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http_get_request/helpers/base_request.dart';
import '/models/item.dart';
import 'package:http/http.dart' as http;

class RequestItem implements HTTPRequest<Item> {
  final String url;
  const RequestItem({required this.url});

  Future<Item> execute() async {
    final response = await http.get(Uri.parse(url));

    /*final responsePost = await http.post(
      Uri.parse(url),
      body: 'Texto que va en el body',
      encoding: Encoding.getByName('utf-8'),
      headers: {'Authentication': token},
    );
    final headers = response.headers;
    final responseLength = response.contentLength;*/

    final client = http.Client();

    client.get(Uri.parse(url));
    client.get(Uri.parse(url));
    client.get(Uri.parse(url));
    client.close();

    if (response.statusCode != 200) {
      throw http.ClientException('Error con los datos');
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response) {
    return Item.fromJson(jsonDecode(response));
  }
}
