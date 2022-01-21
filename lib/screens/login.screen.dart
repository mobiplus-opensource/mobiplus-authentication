import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
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
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Expanded(
                        child: Image(
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
                        padding: EdgeInsets.only(bottom: 10),
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
                                          Color(0xffFF5D00)))),
                          child: ElevatedButton(
                            onPressed: () async {},
                            child: Text('Continuar com Google'),
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth - 120,
                        padding: EdgeInsets.only(bottom: 10),
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
                                          Color(0xff808080)))),
                          child: ElevatedButton(
                            onPressed: () async {},
                            child: Text('Continuar com Apple'),
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
