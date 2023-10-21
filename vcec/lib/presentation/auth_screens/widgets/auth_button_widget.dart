import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final Color bgcolor;
  final Color tcolor;

  AuthButtonWidget({
    Key? key,
    required this.title,
    required this.bgcolor,
    required this.tcolor,
    required this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        shadowColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        onclick();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 145 / 471.31,
          vertical: 8.5,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: tcolor,
          ),
        ),
      ),
    );
  }
}
