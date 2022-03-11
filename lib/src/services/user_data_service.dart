import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobiplus_authentication_flutter/src/entities/user_data.dart';

class UserDataService {
  factory UserDataService() => _instance;
  UserDataService._internal();

  static final UserDataService _instance = UserDataService._internal();
  UserData _userLogged = UserData();

  void save(GoogleSignInAccount user, AuthProvider google) => _userLogged = UserData(
        authProvider: google,
        email: user.email,
        fullName: user.displayName,
        profileImageUrl: user.photoUrl,
      );

  User getUserLoggedInfo() => FirebaseAuth.instance.currentUser!;
}
