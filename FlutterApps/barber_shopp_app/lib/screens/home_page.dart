/// A class that extends the StatefulWidget class and has a State class that extends the State class
import 'package:barber_shopp_app/screens/login_barber_shop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageScreen extends StatefulWidget {
  final User user;
  const HomePageScreen({required this.user});

  @override
  State<HomePageScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageScreen> {
  late User _user;
  bool _isSendingVerification = false;
  bool _isSignOut = false;

  /// > The initState() function is called when the widget is first created
  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NAME: ${_user.displayName}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'EMAIL: ${_user.email}',
                style: Theme.of(context).textTheme.bodyText1,
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
              _isSignOut
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSignOut = true;
                        });

                        FirebaseAuth.instance.signOut();

                        setState(() {
                          _isSignOut = false;
                        });

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginBarberShop(),
                          ),
                        );
                      },
                      child: const Text('Sign Out!'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
