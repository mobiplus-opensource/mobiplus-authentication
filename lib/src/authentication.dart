import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/control_screen.dart';
import 'package:mobiplus_authentication_flutter/src/services/user_data_service.dart';

class Authentication {
  static late BuildContext _context;
  static late UserDataService _userService;

  late Color _backgroundColor = Colors.blueGrey[800]!;
  late Image _image = const Image(image: AssetImage('lib/src/assets/images/mobiplus_logo.png'));

  late String _middleText = 'Olá, \nSeja bem-vindo';
  late String _minorMiddleText = 'Faça login em sua conta para continuar';

  late TextStyle _minorMiddleTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  late TextStyle _middleTextStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  late String _buttonText = 'Continuar com Google';

  late TextStyle _buttonTextStyle = const TextStyle(fontSize: 20);
  late ButtonStyle _buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFF5D00)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    ),
  );

  late final BorderRadius _imageRadiusCircle = BorderRadius.circular(300.0);

  Widget? _afterlogin;

  void afterLogin(Widget screen) => _afterlogin = screen;

  void backGroundColor({Color? backgroundColor}) {
    if (backgroundColor != null) _backgroundColor = backgroundColor;
  }

  void image({Image? image}) {
    if (image != null) _image = image;
  }

  void middleText(String? middleText, TextStyle? middleTextStyle) {
    if (middleText != null) _middleText = middleText;
    if (middleTextStyle != null) _middleTextStyle = middleTextStyle;
  }

  void minorMiddleText(String? minorMiddleText, TextStyle? minorMiddleTextStyle) {
    if (minorMiddleText != null) _minorMiddleText = minorMiddleText;
    if (minorMiddleTextStyle != null) _minorMiddleTextStyle = minorMiddleTextStyle;
  }

  void button({String? buttonText, TextStyle? buttonTextStyle, ButtonStyle? buttonStyle}) {
    if (buttonText != null) _buttonText = buttonText;
    if (buttonTextStyle != null) _buttonTextStyle = buttonTextStyle;
    if (buttonStyle != null) _buttonStyle = buttonStyle;
  }

  initAuthentication(BuildContext buildContext) async {
    _context = buildContext;
    _userService = UserDataService();
    await _launchAuthenticationScreen();
  }

  User getUserLoggedinfo() => _userService.getUserLoggedInfo();

  signOut() async {}

  _launchAuthenticationScreen() async {
    if (_afterlogin == null) return;

    await Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_context) => ControlScreen(
          image: _image,
          buttonText: _buttonText,
          buttonTextStyle: _buttonTextStyle,
          buttonStyle: _buttonStyle,
          afterLogin: _afterlogin!,
          middleText: _middleText,
          midleTextStyle: _middleTextStyle,
          minorMiddleText: _minorMiddleText,
          minormidleTextStyle: _minorMiddleTextStyle,
          imageRadiusCircle: _imageRadiusCircle,
          backgroundColor: _backgroundColor,
        ),
      ),
    );
  }
}
