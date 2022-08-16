import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kcapp/auth/google_auth.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: const BoxConstraints(
        maxWidth: 350,
      ),
      child: ElevatedButton.icon(
        onPressed: () {
          final provider = Provider.of<GoogleAuthenticationProvider>(
            context,
            listen: false,
          );
          provider.googleLogin();
        },
        label: const Text(
          "Register with Google",
        ),
        icon: const Icon(
          Ionicons.logo_google,
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
