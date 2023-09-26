// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/verified_screen.dart';

import '../../../application/otp/otp_cubit.dart';

const auththeme = Color(0xFFE4DEE5);

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  String otp;
  String code2 = '';
  int i = 1;
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
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 245 / 1019,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: auththeme),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      padding: EdgeInsets.only(top: 41, left: 31),
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_outlined)),
                  kheight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Verification',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontStyle: FontStyle.italic,
                            fontSize: 30,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  )
                ],
              ),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 130 / 1019,
            ),
            Text(
              'Please enter the verification code\nsent to your email address',
              style: TextStyle(fontSize: 17, fontFamily: 'Inter'),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 72.5 / 1019,
            ),
            OtpTextField(
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              margin: EdgeInsets.all(6.3),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              fieldWidth: MediaQuery.of(context).size.width * 56 / 470.30,
              filled: true,
              fillColor: auththeme,
              borderColor: auththeme,
              enabledBorderColor: auththeme,
              focusedBorderColor: auththeme,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                code2 += code;
                print(code2);
              },
              onSubmit: (String verificationCode) {
                // log(i.toString());
                //  log((i++).toString());
                //  code2 += verificationCode;
                //  log(verificationCode);
                // try {
                //  log
                //  } catch (e) {
                //     log(e.toString());
                //   }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 145 / 1019,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't recieve an OTP?"),
                TextButton(
                    onPressed: () async {
                      final otpcubit = context.read<OtpCubit>();
                      otpcubit.postEmail(email: email);
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ],
            ),
            kheight10,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    disabledBackgroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    elevation: 10,
                    //shadowColor: Colors.transparent,
                    backgroundColor: auththeme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: ()  {
                    if (otp == code2) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VerifiedScreen(),
                      ));
                    }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width * 145 / 471.31,
                      vertical: 8.5),
                  child: Text(
                    "Verify",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
