import 'package:flutter/material.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onTap,
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
