import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/create_password/create_password_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: auththeme,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/verify.png'),
            ],
          ),
          kheight20,
          Text(
            'Verified',
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 53.h),
          ),
          kheight20,
          Text(
            'Your account has been verified\nsuccessfully.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Inter', fontSize: 21.w),
          ),
          Expanded(child: Container()),
          SizedBox(
            width: 410.w,
            height: 57.w,
            child: AuthButtonWidget(
                title: 'Done',
                bgcolor: kwhite,
                tcolor: kblack,
                elevation: 15,
                borderRadius: 8,
                onclick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreatePasswordScreen(
                  
                    ),
                  ));
                }),
          ),
          SizedBox(
            height: 103.h,
          )
        ],
      )),
    );
  }
}
