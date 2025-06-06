import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';

class OtpTextfieldWidget extends StatelessWidget {
  const OtpTextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
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
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        // showDialog
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text("Verification Code"),
        //         content: Text('Code entered is $verificationCode'),
        //       );
        //     });
      }, // end onSubmit
    );
  }
}
