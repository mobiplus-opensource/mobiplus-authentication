import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future appleSignIn() async {
    if (!await SignInWithApple.isAvailable()) {
      print('This Device is not eligible for Apple Sign in');
      return null;
    }
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
      );

      return await _firebaseSignInWithCredential(oauthCredential);
    } on Exception catch (error) {
      print(error.toString());
      throw Exception();
    }
  }

  
  Future _firebaseSignInWithCredential(OAuthCredential oauthCredential) async {
    final credentialFirebase = await _auth.signInWithCredential(oauthCredential);

    return credentialFirebase;
  }
}
