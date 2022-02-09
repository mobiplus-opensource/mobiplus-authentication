import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';

class Authentication {
  static late final BuildContext _context;

  late Image _image = Image(
    image: AssetImage('lib/src/assets/images/mobiplus_logo.png'),
  );
  late String _buttonText = 'Continuar com Google';
  late TextStyle _buttonTextStyle = const TextStyle(fontSize: 20);
  late ButtonStyle _buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xffFF5D00)));

  void image({Image? image}) {
    if (image != null) {
      _image = image;
    }
  }

  void button(
      {String? buttonText,
      TextStyle? buttonTextStyle,
      ButtonStyle? buttonStyle}) {
    if (buttonText != null) {
      _buttonText = buttonText;
    }

    if (buttonTextStyle != null) {
      _buttonTextStyle = buttonTextStyle;
    }

    if (buttonStyle != null) {
      _buttonStyle = buttonStyle;
    }
  }

  bool initAuthentication(BuildContext buildContext) {
    _context = buildContext;
    _launchAuthenticationScreen();
    return true;
  }

  _launchAuthenticationScreen() {
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (_context) =>
                HomeScreen(_image, _buttonText, _buttonTextStyle, _buttonStyle)));
  }
}
