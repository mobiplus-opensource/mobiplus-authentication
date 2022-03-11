import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user.data.dart';
import 'package:mobiplus_authentication_flutter/src/domain/user/user_data_service.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? _user = null;
  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    String? username = '';
    try {
      final _user = await GoogleSignIn().signIn();

      if (_user == null) {
        print('Usuário cancelou o login!');
        return;
      }

      final GoogleSignInAuthentication? googleAuth = await _user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final userService = UserService();

      userService.save(_user, AuthProvider.google);

      MotionToast.success(
              title: const Text(
                'Login realizado com sucesso',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              layoutOrientation: ORIENTATION.rtl,
              animationType: ANIMATION.fromRight,
              width: 300,
              onClose: () {},
              description: Text(_user.email))
          .show(context);

      if (_user.displayName != null) {
        username = _user.displayName;
      }

      notifyListeners();

      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
