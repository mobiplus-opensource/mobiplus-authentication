import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';

class ControlScreen extends StatelessWidget {
  final Image image;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;
  final Widget afterLogin;

  const ControlScreen(
      this.image, this.buttonText, this.buttonTextStyle, this.buttonStyle, this.afterLogin)
      : super();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else 
              if (snapshot.hasData){
                return afterLogin;
              }
              else if (snapshot.hasError) {
                return Center(child: Text('Algo de errado aconteceu'));
              } else {
                return HomeScreen(
                    image, buttonText, buttonTextStyle, buttonStyle);
              }
            }
        )
      );
}
