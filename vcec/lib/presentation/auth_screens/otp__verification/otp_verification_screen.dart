import 'package:flutter/material.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp__verification/verified_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/otp_textfield_widget.dart';

const theme = Color(0xFFE4DEE5);

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                    color: theme),
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
            OtpTextfieldWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 145 / 1019,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't recieve an OTP?"),
                TextButton(
                    onPressed: () async {
                      // const androidId = AndroidId();
                      // String? deviceId = await androidId.getId();
                      // print(deviceId);
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
                    backgroundColor: theme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerifiedScreen(),
                  ));
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
