import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({
    Key? key,
    required this.image,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.buttonStyle,
    required this.afterLogin,
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
  final Widget afterLogin;
  final BorderRadius imageRadiusCircle;
  final Color backgroundColor;

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
                image: image,
                buttonText: buttonText,
                buttonTextStyle: buttonTextStyle,
                buttonStyle: buttonStyle,
                middleText: middleText,
                midleTextStyle: midleTextStyle,
                minorMiddleText: minorMiddleText,
                minormidleTextStyle: minormidleTextStyle,
                imageRadiusCircle: imageRadiusCircle,
                backgroundColor: backgroundColor,
              );
            }
          },
        ),
      );
}
