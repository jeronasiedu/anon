import 'package:dilo/pages/register.dart';
import 'package:dilo/root_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snapshot.hasError) {
          return const Text("Something went wrong");
        } else if (snapshot.hasData) {
          return const RootApp();
        } else {
          return const RegisterPage();
        }
      },
    );
  }
}
