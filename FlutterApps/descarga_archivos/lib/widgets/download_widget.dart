import 'package:descarga_archivos/providers/progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadWidget extends StatelessWidget {
  final String url =
      'https://luisgarciamillan.es/wp-content/uploads/2021/01/Sistemas-de-Telecomunicaci%C3%B3n.pdf';

  const DownloadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<DownloadProgress>(
        builder: (context, status, _) {
          var progress = status.progress.toStringAsFixed(2);

          return ElevatedButton(
            onPressed: () =>
                status.start(url: url, fileNamePath: 'PDF_Prueba1.pdf'),
            child: Text('${status.progress} %'),
          );
        },
      ),
    );
  }
}
