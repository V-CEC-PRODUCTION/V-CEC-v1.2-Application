import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/otp/otp_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp__verification/verified_screen.dart';

const theme = Color(0xFFE4DEE5);

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  String otp;
  OtpVerificationScreen({super.key, required this.otp, required this.email});

  @override
  Widget build(BuildContext context) {
    String? code1 = '';
    String? code2 = '';
    String? code3 = '';
    String? code4 = '';
    String? code5 = '';
    String? code6 = '';
    TextEditingController controller = TextEditingController();
    int i = 0;
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) => previous.value != current.value,
      listener: (context, state) {
        otp = state.otp!.otp!;
      },
      child: Scaffold(
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
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {
                          code1 = pin1;
                          log(code1!);
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {
                          code2 = pin2;
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {
                          code3 = pin3;
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin4) {
                          code4 = pin4;
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin5) {
                          code5 = pin5;
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin6) {
                          code6 = pin6;
                        },
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    )
                  ],
                )),
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
                        context.read<OtpCubit>().postEmail(email: email);
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
                    String code7 =
                        code1! + code2! + code3! + code4! + code5! + code6!;
                    if (code7.isEmpty) {
                      print('object');
                    }
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Text(code7);
                      },
                    );
                    if (otp == code1) {
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
      ),
    );
  }
}
