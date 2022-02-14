import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user.data.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user_data_service.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';

class Authentication {
  static late final BuildContext _context;
  static late final UserService _userService;

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

  initAuthentication(BuildContext buildContext) async {
    _context = buildContext;
    await _launchAuthenticationScreen();
  }

  getUserLoggedinfo() {
    if (_userService != null) {
      return _userService.getUserLoggedInfo();
    } else {
      return Exception('Undefined user');
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  _launchAuthenticationScreen() async {
    await Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (_context) => HomeScreen(
                _image, _buttonText, _buttonTextStyle, _buttonStyle)));
  }
}