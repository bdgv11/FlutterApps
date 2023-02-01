import 'package:authentication_example/screens/user_screen.dart';
import 'package:authentication_example/utils/firebase_auth.dart';
import 'package:authentication_example/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //
  final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _processing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
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
                        validator: (value) => Validator.validateName(
                            name: _nameFieldController.text),
                        controller: _nameFieldController,
                        focusNode: _focusName,
                        decoration: const InputDecoration(hintText: 'Name'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        validator: (value) => Validator.validateEmail(
                            email: _emailFieldController.text),
                        controller: _emailFieldController,
                        focusNode: _focusEmail,
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        validator: (value) => Validator.validatePassword(
                            password: _passwordFieldController.text),
                        controller: _passwordFieldController,
                        focusNode: _focusPassword,
                        decoration: const InputDecoration(hintText: 'Password'),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _processing
                    ? const CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                _focusName.unfocus;
                                _focusEmail.unfocus;
                                _focusPassword.unfocus;

                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _processing = true;
                                  });

                                  User? user = await FirebaseAuthentication
                                      .singUpUsingEmailAndPass(
                                          name: _nameFieldController.text,
                                          email: _emailFieldController.text,
                                          password:
                                              _passwordFieldController.text);

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
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
