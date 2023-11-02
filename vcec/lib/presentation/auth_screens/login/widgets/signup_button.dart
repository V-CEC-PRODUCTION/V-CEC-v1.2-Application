import 'package:flutter/material.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'New to V CEC ?',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
