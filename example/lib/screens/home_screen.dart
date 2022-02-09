import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/mobiplus_authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Center(
          child: ElevatedButtonTheme(
            data: ElevatedButtonThemeData(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(320, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 20)))),
            child: ElevatedButton(
              onPressed: () async {
                initAuthentication(context);
              },
              child: const Text('Navegar para tela de login'),
            ),
          ),
        );
      }),
    );
  }

  void initAuthentication(BuildContext context) async {
    final auth = Authentication();
    auth.image(image: Image(image: AssetImage('assets/images/mobiplus_logo.png')));
    auth.initAuthentication(context);
  }
}
