import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Snackbar App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ejemplo de Snackbar'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.redAccent,
                      action: SnackBarAction(
                        label: 'Cerrar Snackbar',
                        textColor: Colors.white,
                        onPressed: (){
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }),
                    )
                );
              },
              child: Text('Abrir SNACKBAR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: TextStyle(color: Colors.white)
              ),
            )
          ],
        ),
      ),
    );
  }
}



