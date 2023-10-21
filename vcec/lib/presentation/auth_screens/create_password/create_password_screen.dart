import 'dart:developer';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/email/email_cubit.dart';
import 'package:vcec/application/user/user_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';

class CreatePasswordScreen extends StatelessWidget {
  final String? email;
  CreatePasswordScreen({super.key, this.email});

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);

    //String? password;

    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void passwordVisibility() {
      obtext.value = !obtext.value;
    }

    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return BlocConsumer<EmailCubit, EmailState>(
      listenWhen: (previous, current) => previous.submit != current.submit,
      listener: (context, state) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AccountDetailsScreen(
            deviceId: state.deviceId,
          ),
        ));
      },
      builder: (context, state) {
        if (state.loading == false) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 285 / 1019,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
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
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      } else if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
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
                                    controller: controller,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: sizew * 0.07,
                          right: sizew * 0.05,
                          top: sizew * 0.03),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock_reset,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                } else if (value != controller.text) {
                                  return 'Password must be same';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    kheight10,
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: sizew * 0.15, bottom: sizeh * .15),
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
                          if (controller.text.isEmpty ||
                              controller1.text.isEmpty) {
                            log('hello');
                            FlushbarHelper.createError(
                                    message: 'Fields must not be empty')
                                .show(context);
                          } else if (controller.text != controller1.text) {
                            FlushbarHelper.createError(
                                    message: 'Fields must be same')
                                .show(context);
                          } else {
                            log('hello');
                            final emailcubit = context.read<EmailCubit>();
                            emailcubit.accessToken(
                                email: email!, password: controller1.text);
                          }
                          //  Navigator.of(context).push(MaterialPageRoute(
                          //    builder: (context) => AccountDetailsScreen(),
                          //  ));
                          // log(password.toString());
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width *
                                  145 /
                                  471.31,
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
      },
    );
  }
}
