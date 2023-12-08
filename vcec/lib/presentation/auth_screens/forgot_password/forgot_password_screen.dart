import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_title_with_back.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AuthTopTitleWithBackWidget(
              title: 'Forgot Password',
              fontSize: 40.w,
            ),
            SizedBox(
              height: 240.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: EmailTextField(
                icon: Icons.attachment_outlined,
                text: 'Email ID',
                color: Colors.grey,
                // controller: ,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 70.h,
              width: 400.w,
              child: AuthButtonWidget(
                  title: "Send password reset email",
                  bgcolor: auththeme,
                  tcolor: kblack,
                  onclick: () {},
                  elevation: 10,
                  borderRadius: 8),
            )
          ],
        ),
      )),
    );
  }
}
