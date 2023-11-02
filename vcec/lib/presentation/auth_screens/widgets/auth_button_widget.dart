import 'package:flutter/material.dart';
import 'package:vcec/presentation/auth_screens/create_password/create_password_screen.dart';

class AuthButtonWidget extends StatelessWidget {
  VoidCallback onclick;

  AuthButtonWidget(
      {super.key,
      required this.title,
      required this.bgcolor,
      required this.tcolor,
      required this.onclick});
  final String title;
  final Color bgcolor;
  final Color tcolor;
  // void onclick();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
            shadowColor: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        onPressed: onclick,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 145 / 471.31,
              vertical: 8.5),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: tcolor),
          ),
        ));
  }
}
