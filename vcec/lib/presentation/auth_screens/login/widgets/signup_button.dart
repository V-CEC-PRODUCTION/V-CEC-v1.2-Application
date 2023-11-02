import 'package:flutter/material.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.title,
    required this.buttonTitle, required this.onTap,
  });
  final String title;
  final String buttonTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonTitle,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
