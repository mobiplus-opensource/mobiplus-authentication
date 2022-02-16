import 'package:flutter/material.dart';
import 'package:mobiplus_authentication_flutter/mobiplus_authentication.dart';

class UserSignUpWidget extends StatelessWidget {
  const UserSignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Authentication();
    final user = auth.getUserLoggedinfo();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário logado'),
        centerTitle: true,
        actions: [
          TextButton(
            child: const Text('logout'),
            onPressed: () {
              auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Nome: ' + user.displayName!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text('Email' + user.email!,
                style: const TextStyle(color: Colors.white, fontSize: 16))
          ],
        ),
      ),
    );
  }
}
