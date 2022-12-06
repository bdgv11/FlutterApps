/// _RegisterScreenState is a stateful widget that has a form with three text fields and a button
import 'package:barber_shopp_app/screens/home_page.dart';
import 'package:barber_shopp_app/screens/login_barber_shop.dart';
import 'package:barber_shopp_app/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/firebase_authentication.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _processing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: const Text(''),
        ),*/
      body: GestureDetector(
        onTap: () {
          _focusName.unfocus();
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.8,
              image: AssetImage("Assets/Images/logo6.webp"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) => Validator.validateName(
                              name: _nameFieldController.text),
                          controller: _nameFieldController,
                          focusNode: _focusName,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.white,
                            ),
                            hintText: 'Nombre',
                            errorStyle: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) => Validator.validateEmail(
                              email: _emailFieldController.text),
                          controller: _emailFieldController,
                          focusNode: _focusEmail,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              size: 25,
                              color: Colors.white,
                            ),
                            hintText: 'Correo Electrónico',
                            errorStyle: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) => Validator.validatePassword(
                              password: _passwordFieldController.text),
                          controller: _passwordFieldController,
                          focusNode: _focusPassword,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.key,
                              size: 25,
                              color: Colors.white,
                            ),
                            hintText: 'Contraseña',
                            errorStyle: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                                width: 2,
                              ),
                            ),
                          ),
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
                                style: ElevatedButton.styleFrom(
                                  elevation: 100,
                                  backgroundColor: Colors.teal.withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
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
                                              HomePageScreen(user: user),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  'Registrarse',
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
      ),
    );
  }
}
