import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/providers/google_sign_in_provider.dart';
import 'package:mobiplus_authentication_flutter/src/screens/login_screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.image,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.buttonStyle,
    required this.middleText,
    required this.midleTextStyle,
    required this.minorMiddleText,
    required this.minormidleTextStyle,
    required this.imageRadiusCircle,
    required this.backgroundColor,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: Builder(builder: (context) {
        return LoginScreen(
          image: image,
          buttonText: buttonText,
          buttonTextStyle: buttonTextStyle,
          buttonStyle: buttonStyle,
          middleText: middleText,
          middleTextStyle: midleTextStyle,
          minorMiddleText: minorMiddleText,
          minorMiddleTextStyle: minormidleTextStyle,
          imageRadiusCircle: imageRadiusCircle,
          backgroundColor: backgroundColor,
        );
      }),
    );
  }
}
