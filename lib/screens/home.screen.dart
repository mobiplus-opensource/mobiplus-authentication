import 'package:flutter/material.dart';
import 'package:mobiplus_authentication/provider/google.sign.in.provider.dart';
import 'package:mobiplus_authentication/screens/login.screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Builder(builder: (context) {
        return LoginScreen();
      }),
      create: (BuildContext context) => GoogleSignInProvider(),
    );
  }
}