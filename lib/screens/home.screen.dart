import 'package:flutter/material.dart';
import 'package:mobiplus_authentication/screens/login.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return LoginScreen();
      }),
    );
  }
}
