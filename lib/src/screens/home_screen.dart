import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/provider/google.sign.in.provider.dart';
import 'package:mobiplus_authentication_flutter/src/screens/login_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final Image image;
  final String middleText;
  final TextStyle midleTextStyle;
  final String minorMiddleText;
  final TextStyle minormidleTextStyle;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;
  final BorderRadius imageRadiusCircle;
  final Color backgroundColor;

  const HomeScreen(
      this.image, this.buttonText, this.buttonTextStyle, this.buttonStyle, this.middleText, this.midleTextStyle, this.minorMiddleText, this.minormidleTextStyle, this.imageRadiusCircle, this.backgroundColor)
      : super();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: Builder(builder: (context) {
        return LoginScreen(image, buttonText, buttonTextStyle, buttonStyle, middleText, midleTextStyle, minorMiddleText, minormidleTextStyle, imageRadiusCircle, backgroundColor);
      }),
    );
  }
}
