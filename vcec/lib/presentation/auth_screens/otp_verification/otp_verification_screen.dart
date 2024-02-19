import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_title_with_back.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';

const auththeme = Color(0xFFE4DEE5);

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String code2 = '';

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
                    onPressed: () async {},
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
                  final otp =
                      BlocProvider.of<VerifyEmailAndSignUpWithGoogleCubit>(
                              context)
                          .state
                          .otpModel!
                          .otp;

                  if (otp == code2) {
                    final email = AuthTokenManager.instance.email;
                    final end = email!.substring((email.length) - 13);
                    if (end == "ceconline.edu") {
                      AuthTokenManager.instance.setUserRole(UserRole.student);
                    } else {
                      AuthTokenManager.instance.setUserRole(UserRole.guest);
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/otp_verified', (route) => false);
                  } else {
                    displaySnackBar(context: context, text: "invalid otp");
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
