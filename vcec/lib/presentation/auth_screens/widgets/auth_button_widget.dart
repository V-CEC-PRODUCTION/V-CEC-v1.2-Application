import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget(
      {super.key,
      required this.title,
      required this.bgcolor,
      required this.tcolor,
      required this.onclick,
      required this.elevation,
      required this.borderRadius});

  final String title;
  final Color bgcolor;
  final Color tcolor;
  final double elevation;
  final double borderRadius;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
            shadowColor: Colors.white,
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        onPressed: onclick,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 9),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 24.w,
                color: tcolor),
          ),
        ));
  }
}
