import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/src/screens/home_screen.dart';
class Authentication {
  static late final BuildContext _context;

  bool initAuthentication(BuildContext buildContext) {
    _context = buildContext;
    _launchAuthenticationScreen();
    return true;
  }

  _launchAuthenticationScreen() {
    Navigator.push(
        _context, MaterialPageRoute(builder: (_context) => HomeScreen()));
  }
}
