import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user.data.dart';

class UserService{
  UserData _userLogged = UserData();

  save(GoogleSignInAccount user, AuthProvider google){
    _userLogged = UserData(
      authProvider: google, 
      email: user.email, 
      fullName: user.displayName, 
      profileImageUrl: user.photoUrl);
  }

  getUserLoggedInfo(){
    if (_userLogged.email != null){
      return _userLogged;
    } else{
      log('Undefined user');
    }
  }
}