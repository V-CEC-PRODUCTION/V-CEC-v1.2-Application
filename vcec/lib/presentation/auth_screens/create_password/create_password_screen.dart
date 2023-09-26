import 'package:flutter/material.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
//import 'package:vcec/presentation/auth_screens/otp__verification/otp_verification_screen.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);

    void passwordVisibility() {
      obtext.value = !obtext.value;
    }

    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 285 / 1019,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                      color: auththeme),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 28, left: 22),
                      child: IconButton(
                          style: IconButton.styleFrom(iconSize: 30),
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios_outlined)),
                    ),
                    kheight20,
                    Row(
                      children: [
                        SizedBox(
                          width: sizew * 0.2,
                        ),
                        Text(
                          'Create\nPassword',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(
                    left: sizew * 0.07,
                    right: sizew * 0.05,
                    top: sizeh * 140 / 1019),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ValueListenableBuilder<bool>(
                          valueListenable: obtext,
                          builder: (context, value, child) {
                            return TextFormField(
                              obscureText: !value,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    passwordVisibility();
                                  },
                                  icon: Icon(value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: sizew * 0.07, right: sizew * 0.05, top: sizew * 0.03),
                child: const EmailPassWidget(
                  icon: Icons.lock_reset,
                  text: 'Confirm Password',
                  color: Colors.grey,
                ),
              ),
              kheight10,
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: sizew * 0.15, bottom: sizeh * .15),
                    child: Text(
                      'Must be at least 8 characters',
                      style: TextStyle(fontFamily: 'Inter'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: auththeme,
                      shadowColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountDetailsScreen(),
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
            ],
          ),
        ),
      ),
    );
  }
}
