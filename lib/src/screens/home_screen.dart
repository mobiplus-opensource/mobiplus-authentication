import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/provider/google.sign.in.provider.dart';
import 'package:mobiplus_authentication_flutter/src/screens/login_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;


  const HomeScreen(
   this.buttonText,
   this.buttonTextStyle, 
   this.buttonStyle) : super();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Builder(builder: (context) {
        return LoginScreen(buttonText, buttonTextStyle, buttonStyle);
      }),
      create: (BuildContext context) => GoogleSignInProvider(),
    );
  }
}