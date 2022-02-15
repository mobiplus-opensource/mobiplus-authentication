import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user.data.dart';

class UserService {
  static final UserService _instance = UserService._internal();

  factory UserService() {
    return _instance;
  }

  UserService._internal();

  UserData _userLogged = UserData();

  save(GoogleSignInAccount user, AuthProvider google) {
    _userLogged = UserData(
        authProvider: google,
        email: user.email,
        fullName: user.displayName,
        profileImageUrl: user.photoUrl);
  }

  User getUserLoggedInfo() {
    return FirebaseAuth.instance.currentUser!;
  }
}
