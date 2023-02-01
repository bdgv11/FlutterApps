import 'package:authentication_example/screens/register_screen.dart';
import 'package:authentication_example/screens/user_screen.dart';
import 'package:authentication_example/utils/firebase_auth.dart';
import 'package:authentication_example/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _processing = false;

  @override
  void dispose() {
    super.dispose();
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: FutureBuilder(
          future: _initFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[600]),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => Validator.validateEmail(
                                email: _emailFieldController.text),
                            controller: _emailFieldController,
                            focusNode: _focusEmail,
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            validator: (value) => Validator.validatePassword(
                                password: _passwordFieldController.text),
                            controller: _passwordFieldController,
                            focusNode: _focusPassword,
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                            obscureText: true,
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),

                    /// A ternary operator. It is a shorthand for an if-else statement.
                    _processing
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    _focusEmail.unfocus();
                                    _focusPassword.unfocus();

                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        _processing = true;
                                      });

                                      // LOGICA DEL LOG IN
                                      User? user = await FirebaseAuthentication
                                          .signInUsingEmailAndPassword(
                                        email: _emailFieldController.text,
                                        password: _passwordFieldController.text,
                                      );

                                      setState(() {
                                        _processing = false;
                                      });

                                      if (user != null) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserScreen(user: user),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(8)),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
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
                          )
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<FirebaseApp> _initFirebase() async {
    FirebaseApp firebaseapp = await Firebase.initializeApp();
    return firebaseapp;
  }
}
