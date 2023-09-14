import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/create_password/create_password_screen.dart';
import 'package:vcec/presentation/auth_screens/otp__verification/otp_verification_screen.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: theme,
          ),
          Column(
            children: [
              SizedBox(
                height: sizeh * .1,
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
                    fontSize: sizeh * .05),
              ),
              kheight20,
              Text(
                'Your account has been verified\nsuccessfully.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Inter', fontSize: sizeh * .023),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreatePasswordScreen(),
                    ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * 145 / 471.31,
                        vertical: 8.5),
                    child: Text(
                      "Done",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  )),
              SizedBox(
                height: sizeh * 0.13,
              )
            ],
          ),
        ],
      )),
    );
  }
}
