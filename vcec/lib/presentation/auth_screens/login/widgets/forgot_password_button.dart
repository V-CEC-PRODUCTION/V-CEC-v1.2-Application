import 'package:flutter/material.dart';
import 'package:vcec/presentation/auth_screens/forgot_password/forgot_password_screen.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ForgotPasswordScreen()));
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
