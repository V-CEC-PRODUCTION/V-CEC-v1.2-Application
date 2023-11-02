import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vcec/application/signup/signup_with_google/signup_with_google_cubit.dart';
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_page_title.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
              (failure) {
                if (!state.isLoading) {
                  if (failure == const MainFailure.serverFailure()) {
                    displaySnackBar(context: context, text: "Server is down");
                  } else {
                    displaySnackBar(
                        context: context, text: "Something went wrong");
                  }
                }
              },
              (r) {
                Navigator.of(context).pushNamed(
                  '/otp_verification',
                );
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: loadingWidget,
            );
          }
          return SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/sign_up.png'),
                        fit: BoxFit.fitWidth),
                  ),
                  height: sizeh * .456,
                  width: double.infinity,
                ),
                SizedBox(
                  height: sizeh * .0471,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: sizew * .0914,
                    ),
                    AuthPageTitle(name: 'Sign up', fontsize: 35),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: sizew * 0.07,
                      right: sizew * 0.05,
                      top: sizew * 0.05),
                  child: EmailTextField(
                    icon: Icons.attachment_outlined,
                    text: 'Email ID',
                    color: Colors.grey,
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: sizeh * .0571,
                ),
                Container(
                  width: sizew * 0.85,
                  height: sizew * 0.11,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (emailController.text.length < 5) {
                        return;
                      }
                      BlocProvider.of<VerifyEmailCubit>(context)
                          .verifyEmail(email: emailController.text);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(sizew * 0.02)))),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          fontSize: sizew * 0.045, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: sizew * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: sizew * 0.32,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 131, 131),
                        ),
                      ),
                      Container(
                        width: sizew * 0.32,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: sizew * 0.04),
                  child: Container(
                    width: sizew * 0.85,
                    height: sizew * 0.11,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]),
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignupWithGoogleCubit>(context)
                            .signUpWithGoogle();
                      },
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 221, 218, 218)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          sizew * 0.02)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                                ),
                              ),
                            ),
                            width: sizew * 0.06,
                            height: sizew * 0.06,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: sizew * 0.07),
                            child: Text(
                              'Sign up with Google',
                              style: TextStyle(
                                  fontSize: sizew * 0.045, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
