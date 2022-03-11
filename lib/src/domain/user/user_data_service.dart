import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user.data.dart';

class UserService {
  factory UserService() => _instance;
  UserService._internal();

  static final UserService _instance = UserService._internal();
  UserData _userLogged = UserData();

  void save(GoogleSignInAccount user, AuthProvider google) => _userLogged = UserData(
        authProvider: google,
        email: user.email,
        fullName: user.displayName,
        profileImageUrl: user.photoUrl,
      );

  User getUserLoggedInfo() => FirebaseAuth.instance.currentUser!;
}
