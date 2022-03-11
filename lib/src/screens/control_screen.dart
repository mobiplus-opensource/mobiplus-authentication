import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';

class ControlScreen extends StatelessWidget {
  final Image image;
  final String middleText;
  final TextStyle midleTextStyle;
  final String minorMiddleText;
  final TextStyle minormidleTextStyle;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;
  final Widget afterLogin;
  final BorderRadius imageRadiusCircle;
  final Color backgroundColor;

  const ControlScreen(
      this.image,
      this.buttonText,
      this.buttonTextStyle,
      this.buttonStyle,
      this.afterLogin,
      this.middleText,
      this.midleTextStyle,
      this.minorMiddleText,
      this.minormidleTextStyle,
      this.imageRadiusCircle,
      this.backgroundColor)
      : super();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return afterLogin;
            } else if (snapshot.hasError) {
              return const Center(child: Text('Algo de errado aconteceu'));
            } else {
              return HomeScreen(
                  image,
                  buttonText,
                  buttonTextStyle,
                  buttonStyle,
                  middleText,
                  midleTextStyle,
                  minorMiddleText,
                  minormidleTextStyle,
                  imageRadiusCircle,
                  backgroundColor);
            }
          }));
}
