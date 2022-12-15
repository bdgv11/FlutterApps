import 'package:barber/feature_home/widgets/bottom_navigation.dart';
import 'package:barber/feature_home/widgets/drawer_widget.dart';
import 'package:barber/feature_login/screens/login_barber_shop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(backgroundColor: Colors.black87),
      drawer: DrawerUserWidget(user: _user),
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.white),
            color: Colors.white,
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Color.fromARGB(255, 104, 34, 4),
                    Color.fromARGB(255, 187, 194, 188),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(
                    'Nombre: ${_user.displayName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Barlow',
                        color: Colors.white,
                        fontSize: 34),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(
                    'Correo: ${_user.email}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Barlow', color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  _user.emailVerified
                      ? const Text(
                          'Email verificado!',
                          style: TextStyle(
                              color: Colors.green, fontFamily: 'Barlow'),
                        )
                      : const Text(
                          'Email NO verificado!',
                          style: TextStyle(
                              color: Colors.red, fontFamily: 'Barlow'),
                        ),
                  const Padding(padding: EdgeInsets.all(8)),
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationWidget(
        user: _user,
      ),
    );
  }
}
