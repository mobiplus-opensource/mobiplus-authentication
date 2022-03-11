import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobiplus_authentication_flutter/src/provider/google.sign.in.provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final Image image;
  final String middleText;
  final TextStyle middleTextStyle;
  final String minorMiddleText;
  final TextStyle minorMiddleTextStyle;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final ButtonStyle buttonStyle;
  final BorderRadius imageRadiusCircle;
  final Color backgroundColor;

  const LoginScreen(
      this.image,
      this.buttonText,
      this.buttonTextStyle,
      this.buttonStyle,
      this.middleText,
      this.middleTextStyle,
      this.minorMiddleText,
      this.minorMiddleTextStyle,
      this.imageRadiusCircle,
      this.backgroundColor,
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
        backgroundColor: Colors.blueGrey[800],
        body: LayoutBuilder(builder: (_, constraints) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: ClipRRect(
                        child: widget.image,
                        borderRadius: widget.imageRadiusCircle)),
                const Spacer(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.middleText,
                      style: widget.middleTextStyle,
                    )),
                const SizedBox(height: 8),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.minorMiddleText,
                      style: widget.minorMiddleTextStyle,
                    )),
                const Spacer(),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Container(
                      width: constraints.maxWidth - 120,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: const Size(double.infinity, 50)),
                        onPressed: () async {
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin(context);
                        },
                        icon: const FaIcon(FontAwesomeIcons.google,
                            color: Colors.red),
                        label: Text(
                          widget.buttonText,
                          style: widget.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
