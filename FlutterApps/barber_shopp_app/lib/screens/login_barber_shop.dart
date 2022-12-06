import 'package:barber_shopp_app/screens/home_page.dart';
import 'package:barber_shopp_app/screens/register_page.dart';
import 'package:barber_shopp_app/utils/firebase_authentication.dart';
import 'package:barber_shopp_app/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBarberShop extends StatefulWidget {
  const LoginBarberShop({super.key});

  @override
  State<LoginBarberShop> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginBarberShop> {
  /// Creating a controller for the email and password fields.
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  /// Creating a focus node for the email and password fields.
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  /// A key that is used to identify the form and validate the form.
  final _formKey = GlobalKey<FormState>();

  bool _processingLogIn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Color.fromARGB(255, 48, 26, 79),
                Color.fromARGB(255, 20, 154, 140),
              ],
            ),
          ),
          child: FutureBuilder(
            future: _initFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Bienvenido, inicia sesión para continuar.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Barlow'),
                            ),
                            const Padding(padding: EdgeInsets.all(30)),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) => Validator.validateEmail(
                                  email: _emailFieldController.text),
                              controller: _emailFieldController,
                              focusNode: _focusEmail,
                              decoration: const InputDecoration(
                                hintText: 'Correo electrónico',
                                errorStyle: TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontFamily: 'Barlow'),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(20)),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              validator: (value) => Validator.validatePassword(
                                  password: _passwordFieldController.text),
                              controller: _passwordFieldController,
                              focusNode: _focusPassword,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                errorStyle: const TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                                hintStyle: const TextStyle(
                                    color: Colors.white, fontFamily: 'Barlow'),
                              ),
                              obscureText: true,
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(20)),
                      _processingLogIn
                          ? const CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 30,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () async {
                                      /// Checking if the form is valid.
                                      _focusEmail.unfocus();
                                      _focusPassword.unfocus();

                                      /// Validating the form.
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _processingLogIn = true;
                                        });

                                        /// Trying to log in the user using the email and password that
                                        /// the user has entered.
                                        User? user =
                                            await FirebaseAuthentication
                                                .signInUsingEmailAndPassword(
                                                    email: _emailFieldController
                                                        .text,
                                                    password:
                                                        _passwordFieldController
                                                            .text);

                                        /// Telling the framework to rebuild the widget.
                                        setState(() {
                                          _processingLogIn = false;
                                        });

                                        /// Checking if the user is not null. If the user is not null, it
                                        /// is navigating to the HomePageScreen.
                                        if (user != null) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                HomePageScreen(user: user),
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 20, 154, 140),
                                              content: Text(
                                                'Correo NO existe o contrasena incorrecta',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Barlow'),
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 120, 43, 132),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Barlow'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '¿No tienes cuenta? ',
                            style: TextStyle(
                                color: Colors.white54, fontFamily: 'Barlow'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Registrate',
                              style: GoogleFonts.barlow(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  /// It initializes the firebase app.
  /// Returns:
  ///   A Future object that will eventually contain a FirebaseApp object.
  Future<FirebaseApp> _initFirebase() async {
    FirebaseApp firebaseapp = await Firebase.initializeApp();
    return firebaseapp;
  }
}
