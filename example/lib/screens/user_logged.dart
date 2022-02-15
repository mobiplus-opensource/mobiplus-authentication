import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_example/screens/user_sign_up_widget.dart';

class UserLogged extends StatelessWidget{
  const UserLogged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: UserSignUpWidget(),
  );
}