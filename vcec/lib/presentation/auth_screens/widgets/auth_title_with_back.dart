import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';

class AuthTopTitleWithBackWidget extends StatelessWidget {
  const AuthTopTitleWithBackWidget({
    super.key,
    required this.title,
    required this.fontSize,
  });
  final String title;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          color: auththeme),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 28.w, left: 22.w),
            child: IconButton(
                style: IconButton.styleFrom(iconSize: 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
          ),
          kheight20,
          Row(
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
