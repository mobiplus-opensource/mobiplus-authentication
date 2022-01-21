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
          return Column(
            children: [
              Flexible(
                child: Container(
                  color: Colors.white,
                    child: Expanded(
                      child: Image(
                        image: AssetImage('lib/assets/images/mobiplus_logo.png'),
                      ),
                    )),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(style: ButtonStyle()),
                      child: ElevatedButton(
                        onPressed: () async {},
                        child: Text('Continuar com Google'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(style: ButtonStyle()),
                      child: ElevatedButton(
                        onPressed: () async {},
                        child: Text('Continuar com Apple'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
