import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';

class OtpVerificationTopWidget extends StatelessWidget {
  const OtpVerificationTopWidget({
    super.key,
  });

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
                icon: Icon(Icons.arrow_back_ios_outlined)),
          ),
          kheight20,
          Row(
            children: [
              SizedBox(
                width: 100.w,
              ),
              Text(
                'Verification',
                style: TextStyle(
                    fontSize: 55.w,
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
