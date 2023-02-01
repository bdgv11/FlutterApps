import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadProgress with ChangeNotifier {
  double _progress = 0;

  double get progress => _progress;

  set progress(double value) {
    _progress = value;
  }

  void start({required String url, required fileNamePath}) async {
    _reset();

    final directories = await getExternalStorageDirectory();
    final finalPath = '${directories!.path}/' + fileNamePath;

    print(finalPath);

    //Download
    await Dio().download(
      url,
      finalPath,
      options: Options(
        headers: {
          HttpHeaders.acceptEncodingHeader: '*',
        },
      ),
      onReceiveProgress: (received, total) {
        if (total != -1) {
          var pos = received / total * 100;
          updateProgress(pos);
        }
      },
    );
  }

  void updateProgress(double value) {
    _progress = value;
    notifyListeners();
  }

  void _reset() {
    if (progress != 0) {
      progress = 0;
      notifyListeners();
    }
  }
}
