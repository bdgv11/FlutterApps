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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  final _controller = TextEditingController();
  String _textoIntroducido = 'Ningun texto aun';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'Formulario:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    TextField(
                      decoration:
                          InputDecoration(hintText: 'Introduzca el texto'),
                      controller: _controller,
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration:
                          const BoxDecoration(color: Colors.blue, boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 25,
                            spreadRadius: 5,
                            offset: Offset(0, 15))
                      ]),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Texto que se esta introduciendo en vivo: ',
                          ),
                          Text(
                            '$_textoIntroducido',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener((_mostrarValorIntroducido));
    _controller.value = TextEditingValue(text: 'Valor inicial');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _mostrarValorIntroducido() {
    setState(() {
      _textoIntroducido = _controller.text;
    });
  }
}
