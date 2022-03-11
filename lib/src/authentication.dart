import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user_data_service.dart';
import 'package:mobiplus_authentication_flutter/src/screens/control_screen.dart';

class Authentication {
  static late BuildContext _context;
  static late UserService _userService;

  late Color _backgroundColor = Colors.blueGrey[800]!;

  late Image _image = const Image(
    image: AssetImage('lib/src/assets/images/mobiplus_logo.png'),
  );
  late String _middleText = 'Olá, \nSeja bem-vindo';
  late TextStyle _middleTextStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  late String _minorMiddleText = 'Faça login em sua conta para continuar';
  late TextStyle _minorMiddleTextStyle =
      const TextStyle(fontSize: 16, color: Colors.white);
  late final BorderRadius _imageRadiusCircle = BorderRadius.circular(300.0);

  late String _buttonText = 'Continuar com Google';
  late TextStyle _buttonTextStyle = const TextStyle(fontSize: 20);
  late ButtonStyle _buttonStyle = ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xffFF5D00)));

  late Widget _afterlogin;

  void afterLogin(Widget userLogged) {
    _afterlogin = userLogged;
  }

  void backGroundColor({Color? backgroundColor}) {
    if (backgroundColor != null) {
      _backgroundColor = backgroundColor;
    }
  }

  void image({Image? image}) {
    if (image != null) {
      _image = image;
    }
  }

  void middleText(String? middleText, TextStyle? middleTextStyle) {
    if (middleText != null) {
      _middleText = middleText;
    }

    if (middleTextStyle != null) {
      _middleTextStyle = middleTextStyle;
    }
  }

  void minorMiddleText(
      String? minorMiddleText, TextStyle? minorMiddleTextStyle) {
    if (minorMiddleText != null) {
      _minorMiddleText = minorMiddleText;
    }

    if (minorMiddleTextStyle != null) {
      _minorMiddleTextStyle = minorMiddleTextStyle;
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

  initAuthentication(BuildContext buildContext) async {
    _context = buildContext;
    _userService = UserService();

    await _launchAuthenticationScreen();
  }

  User getUserLoggedinfo() {
    return _userService.getUserLoggedInfo();
  }

  signOut() async {}

  _launchAuthenticationScreen() async {
    await Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (_context) => ControlScreen(
                  _image,
                  _buttonText,
                  _buttonTextStyle,
                  _buttonStyle,
                  _afterlogin,
                  _middleText,
                  _middleTextStyle,
                  _minorMiddleText,
                  _minorMiddleTextStyle,
                  _imageRadiusCircle,
                  _backgroundColor,
                )));
  }
}
