// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/google/google_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/verified_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_title_with_back.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';

const auththeme = Color(0xFFE4DEE5);

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  final String otp;
  String code2 = '';
  final int i = 1;
  OtpVerificationScreen({
    Key? key,
    required this.email,
    required this.otp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTopTitleWithBackWidget(
              title: 'Verification',
              fontSize: 55.w,
            ),
            SizedBox(
              height: 140.h,
            ),
            const Text(
              'Please enter the verification code\nsent to your email address',
              style: TextStyle(fontSize: 17, fontFamily: 'Inter'),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(
              height: 70.h,
            ),
            OtpTextField(
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              margin: const EdgeInsets.all(6.3),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              fieldWidth: MediaQuery.of(context).size.width * 56 / 470.30,
              filled: true,
              fillColor: auththeme,
              borderColor: auththeme,
              enabledBorderColor: auththeme,
              focusedBorderColor: auththeme,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                code2 = verificationCode;
              },
            ),
            SizedBox(
              height: 145.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't recieve an OTP?"),
                TextButton(
                    onPressed: () async {
                      final otpcubit = context.read<GoogleCubit>();
                      otpcubit.postEmail(email: email);
                    },
                    child: const Text(
                      'Resend OTP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ],
            ),
            kheight10,
            SizedBox(
              width: 360.w,
              height: 52.w,
              child: AuthButtonWidget(
                  title: 'Verify',
                  bgcolor: auththeme,
                  tcolor: kblack,
                  borderRadius: 8,
                  elevation: 6,
                  onclick: () {
                    if (otp == code2) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VerifiedScreen(
                          email: email,
                        ),
                      ));
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}
