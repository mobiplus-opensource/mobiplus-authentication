import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user_data_service.dart';
import 'package:mobiplus_authentication_flutter/src/provider/google.sign.in.provider.dart';
import 'package:mobiplus_authentication_flutter/src/screens/control_screen.dart';
import 'package:provider/provider.dart';

class Authentication {
  static late BuildContext _context;
  static late UserService _userService;
  static late GoogleSignInProvider _provider;

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

  late Widget _afterlogin;

  void afterLogin(Widget userLogged) {
    _afterlogin = userLogged;
  }

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

  initAuthentication(BuildContext buildContext) async {
    _context = buildContext;
    _userService = UserService();

    await _launchAuthenticationScreen();
  }

  User getUserLoggedinfo() {
    return _userService.getUserLoggedInfo();
  }

  signOut() async {

  }

  _launchAuthenticationScreen() async {
    await Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (_context) => ControlScreen(_image, _buttonText,
                _buttonTextStyle, _buttonStyle, _afterlogin)));
  }
}
