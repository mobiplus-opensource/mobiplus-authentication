import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/provider/google.sign.in.provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Image image;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;

  const LoginScreen(
      this.image, this.buttonText, this.buttonTextStyle, this.buttonStyle,
      {Key? key})
      : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenStates();
}

class LoginScreenStates extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(builder: (_, constraints) {
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: widget.image),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth - 120,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                              style: widget.buttonStyle),
                          child: ElevatedButton(
                            onPressed: () async {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin(context);
                            },
                            child: Text(
                              widget.buttonText,
                              style: widget.buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
