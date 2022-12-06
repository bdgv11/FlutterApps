/// It returns a MaterialApp widget that has a title, a home, and a debugShowCheckedModeBanner
import 'package:barber_shopp_app/screens/login_barber_shop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BarberShopApp());
}

class BarberShopApp extends StatelessWidget {
  const BarberShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Barber Shop App',
      home: LoginBarberShop(),
      debugShowCheckedModeBanner: false,
    );
  }
}
