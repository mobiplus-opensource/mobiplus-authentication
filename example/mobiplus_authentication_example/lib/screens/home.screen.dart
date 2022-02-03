import 'package:flutter/material.dart';

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
                    minimumSize: MaterialStateProperty.all<Size>(Size(320, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 20)))),
            child: ElevatedButton(
              onPressed: () async {
                initAuth(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => BlockScreen()),
                // );
              },
              child: Text('Me clique'),
            ),
          ),
        );
      }),
    );
  }

  void initAuth(BuildContext context) async {
    // final blockApp = BlockApp();
    // blockApp.image( image: Image(
    // image: AssetImage('assets/images/10772206.jpg')));                                                       
    // await blockApp.initVersionBlocker(context);
  }
}