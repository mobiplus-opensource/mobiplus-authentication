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
                    child: widget.image),
                const Spacer(),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Olá, \nSeja bem-vindo novamente',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                const SizedBox(height: 8),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Faça login em sua\nconta para continuar ',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                      child: ElevatedButtonTheme(
                        data:
                            ElevatedButtonThemeData(style: widget.buttonStyle),
                        child: ElevatedButton(
                          onPressed: () async {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
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
                RichText(
                    text:
                        const TextSpan(text: 'Já possui uma conta?', children: [
                  TextSpan(
                      text: 'Log in',
                      style: TextStyle(decoration: TextDecoration.underline))
                ])),
              ],
            ),
          );
        }),
      ),
    );
  }
}
