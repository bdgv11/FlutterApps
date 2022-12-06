/// A stateful widget that contains a form that has two text fields, one for the email and one for the
/// password. It also has two buttons, one for logging in and one for registering
9
import 'package:barber_shopp_app/screens/home_page.dart';
import 'package:barber_shopp_app/screens/register_page.dart';
import 'package:barber_shopp_app/utils/firebase_authentication.dart';
import 'package:barber_shopp_app/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
        /*appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text(
            'Barber Shop',
            style: TextStyle(color: Colors.white),
          ),
        ),*/
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/Images/login3.jpeg"),
                fit: BoxFit.cover),
          ),
          child: FutureBuilder(
            future: _initFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) => Validator.validateEmail(
                                  email: _emailFieldController.text),
                              controller: _emailFieldController,
                              focusNode: _focusEmail,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.person,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                hintText: 'Email',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.amber, width: 2),
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(8)),
                            TextFormField(
                              validator: (value) => Validator.validatePassword(
                                  password: _passwordFieldController.text),
                              controller: _passwordFieldController,
                              focusNode: _focusPassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.amber, width: 2),
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                                icon: const Icon(
                                  Icons.key,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              obscureText: true,
                            )
                          ],
                        ),
                      ),
                      _processingLogIn
                          ? const CircularProgressIndicator()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 30,
                                      backgroundColor: Colors.amber,
                                      shadowColor: Colors.amberAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Log In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 100,
                                      backgroundColor: Colors.amber,
                                      shadowColor: Colors.amberAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
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
