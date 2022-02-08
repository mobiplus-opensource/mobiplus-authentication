import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? _user = null;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    final _user = await GoogleSignIn().signIn();

    if (_user == null){
      print('Usuário cancelou o login!');
    }

    final GoogleSignInAuthentication? googleAuth =
        await _user?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }

    String? username = '';
    if (_user?.displayName != null){
      username = _user?.displayName;
    }

    MotionToast.success(
      title: Text(
        'Login realizado com sucesso',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      layoutOrientation: ORIENTATION.rtl,
      animationType: ANIMATION.fromRight,
      width: 300,
      onClose: () {
      }, description: Text(username!)
    ).show(context);

    notifyListeners();
  }
}
