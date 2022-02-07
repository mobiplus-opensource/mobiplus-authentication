import 'package:flutter/widgets.dart';
import 'package:mobiplus_authentication_flutter/src/screens/login_screen.dart';

class Authentication {
  static late final BuildContext _context;

  bool initAuthentication(BuildContext buildContext) {
    _context = buildContext;
    launchAuthenticationScreen();
    return true;
  }

  launchAuthenticationScreen(){
    const LoginScreen();
  }
}
