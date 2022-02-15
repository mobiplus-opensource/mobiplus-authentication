import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_example/screens/user_logged.dart';
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
                await initAuthentication(context);
              },
              child: const Text('Navegar para tela de login'),
            ),
          ),
        );
      }),
    );
  }

  Future<void> initAuthentication(BuildContext context) async {
    final auth = Authentication();
    auth.image(
        image: const Image(image: AssetImage('assets/images/mobiplus_logo.png')));
    auth.afterLogin(UserLogged());
    await auth.initAuthentication(context);
  }
}