import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  XFile? _imageFile;
  dynamic? _pickImageError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _visualizarImagen(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _onImageButtonPressed(ImageSource.gallery);
              },
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              child: const Icon(Icons.photo_camera),
              onPressed: () {
                _onImageButtonPressed(ImageSource.camera);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _visualizarImagen() {
    if (_imageFile != null) {
      return Image.file(
        File(_imageFile!.path),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Error de recuperacion de la imagen: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'No hay imagen',
        textAlign: TextAlign.center,
      );
    }
  }

  void _onImageButtonPressed(ImageSource source) async {
    try {
      _imageFile = await ImagePicker().pickImage(source: source);
      setState(() {}); //esto recarga la app, no es necesarioo pasarle nada
    } catch (e) {
      _pickImageError = e;
    }
  }
}
