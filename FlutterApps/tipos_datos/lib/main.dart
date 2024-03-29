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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Text Fields'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // ESTO SIRVE PORQUE CUANDO SE ABRE EL TECLADO SE SOBREPONE A LO QUE HAY EN LA PANTALLA, ENTONCES SE EVITA CON ESO
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Formulario',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: const [
                    Text('Contrasena: '),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'CONTRASENA',
                      ),
                      obscureText: true,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Datetime:'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'DATETIME',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Email:'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email address',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Multiline:'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Multiline',
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Numeros:'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Numeros',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Numeros telefonico:'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Numeros telefonico',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('URL'),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'URL',
                      ),
                      keyboardType: TextInputType.url,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
