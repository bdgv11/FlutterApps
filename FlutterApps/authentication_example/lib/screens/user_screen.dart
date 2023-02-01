import 'package:authentication_example/screens/login_screen.dart';
import 'package:authentication_example/utils/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  final User user;

  const UserScreen({super.key, required this.user});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //
  late User _user;
  bool _isSendingVerification = false;
  bool _isSignInOut = false;

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_user.displayName}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(),
            Text(
              'EMAIL: ${_user.email}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            _user.emailVerified
                ? const Text('Email verificado!',
                    style: TextStyle(color: Colors.green))
                : const Text('Email NO verificado!',
                    style: TextStyle(color: Colors.red)),
            _user.emailVerified
                ? Container()
                : _isSendingVerification
                    ? const CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isSendingVerification = true;
                              });

                              await _user.sendEmailVerification();

                              setState(() {
                                _isSendingVerification = false;
                              });
                            },
                            child: const Text('Verificar Email'),
                          ),
                        ],
                      ),
            _isSignInOut
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSignInOut = true;
                      });

                      FirebaseAuth.instance.signOut();

                      setState(() {
                        _isSignInOut = false;
                      });

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign Out!'),
                  ),
          ],
        ),
      ),
    );
  }
}
