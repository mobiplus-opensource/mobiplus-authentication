import 'package:flutter/material.dart';
import 'package:mobiplus_authentication/provider/google.sign.in.provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() {
    return LoginScreenStates();
  }
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
                      child: const Expanded(
                        child: const Image(
                          image:
                              AssetImage('lib/assets/images/mobiplus_logo.png'),
                        ),
                      )),
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
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xffFF5D00)))),
                          child: ElevatedButton(
                            onPressed: () async {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                                      provider.googleLogin(context);
                            },
                            child: const Text('Continuar com Google'),
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth - 120,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff808080)))),
                          child: ElevatedButton(
                            onPressed: () async {},
                            child: const Text('Continuar com Apple'),
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
