import 'package:barber_shopp_app/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigationWidget extends StatefulWidget {
  final User user;

  const BottomNavigationWidget({required this.user});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late User _user;
  int _currentIndex = 0;

  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //backgroundColor: Color.fromARGB(139, 10, 170, 148),
      backgroundColor: Colors.black87,
      selectedFontSize: 0,
      currentIndex: _currentIndex,
      iconSize: 30,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print('Usuario conectado ${_user.displayName}');

          if (_currentIndex == 0) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePageScreen(user: _user),
            ));
          }
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.white), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined, color: Colors.white, size: 45),
            label: ''),
        BottomNavigationBarItem(
            icon:
                Icon(Icons.notifications_active_outlined, color: Colors.white),
            label: ''),
      ],
    );
  }
}