import 'package:barber_shopp_app/models/services.dart';
import 'package:barber_shopp_app/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer_widget.dart';

class AppointmentScreen extends StatefulWidget {
  final User user;
  const AppointmentScreen({required this.user});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  //
  late User _user;
  //
  final List _services = [
    KindOfServices(
        'Corte', 30, Image.asset('Assets/Images/avatar1.jpeg'), 5500),
    KindOfServices('Barba', 30, Image.asset('Assets/Images/logo2.jpeg'), 5500),
    KindOfServices(
        'Corte y Barba', 45, Image.asset('Assets/Images/logo1.png'), 5500),
    KindOfServices('Cejas', 15, Image.asset('Assets/Images/logo2.jpeg'), 5500),
  ];

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
      body: Container(
        padding: const EdgeInsets.only(top: 5),
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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: _services.length,
          itemBuilder: (context, index) {
            final item = _services.elementAt(index);
            return Card(
              color: Colors.transparent,
              surfaceTintColor: Colors.white,
              elevation: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 80,
                        child: item.image,
                      ),
                      const Divider(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cut_rounded,
                              color: Colors.white,
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '${item.nombre}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Barlow-Thin'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              color: Colors.white,
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '${item.tiempoDuracion}m',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Barlow-Thin'),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.colonSign,
                              color: Colors.white,
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Text(
                              '${item.precio}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Barlow-Thin'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        user: _user,
      ),
    );
  }
}
