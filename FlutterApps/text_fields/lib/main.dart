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
  String _textoAlCambiar = 'Ninguno';
  String _textoEnviado = 'Ningun texto enviado';

  TextStyle style1 = TextStyle(color: Colors.white);

  TextStyle style2 =
      TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold);

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
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Text('Introduce tu nombre'),
                    TextField(
                      decoration: const InputDecoration(
                          hintText: 'Introduce tu nombre'),
                      onChanged: (value) {
                        setState(() {
                          _textoAlCambiar = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          _textoEnviado = value;
                        });
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Texto que se esta introduciendo en vivo: ',
                            style: style2,
                          ),
                          Text(
                            '$_textoAlCambiar',
                            style: style1,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Texto que se ha enviado en el TextField: ',
                            style: style2,
                          ),
                          Text(
                            '$_textoEnviado',
                            style: style1,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                      decoration:
                          const BoxDecoration(color: Colors.blue, boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 25,
                            spreadRadius: 5,
                            offset: Offset(0, 15))
                      ]),
                    )
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
