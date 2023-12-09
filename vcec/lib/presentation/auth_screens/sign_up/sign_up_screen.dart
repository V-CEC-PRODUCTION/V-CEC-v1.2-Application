import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/login/widgets/signup_button.dart';
import 'package:vcec/presentation/auth_screens/sign_up/widget/signup_image.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_page_title.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/auth_screens/widgets/login_with_google.dart';
import 'package:vcec/presentation/auth_screens/widgets/or_widget.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<VerifyEmailAndSignUpWithGoogleCubit,
            VerifyEmailAndSignUpWithGoogleState>(listener: (context, state) {
      state.isFailureOrSuccess.fold(
        () {},
        (either) => either.fold(
          (failure) {
            if (!state.isLoading) {
              if (failure == const MainFailure.serverFailure()) {
                displaySnackBar(context: context, text: "Server is down");
              } else if (failure == const MainFailure.clientFailure()) {
                displaySnackBar(
                    context: context,
                    text: "Something wrong with your network");
              } else if (failure == const MainFailure.authFailure()) {
                displaySnackBar(
                    context: context, text: 'Account already exists');
              } else {
                displaySnackBar(
                    context: context, text: "Something Unexpected Happened");
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
      state.isFailureOrSuccessForGoogle.fold(
        () {},
        (either) => either.fold(
          (failure) {
            if (!state.isLoading) {
              if (failure == const MainFailure.serverFailure()) {
                displaySnackBar(context: context, text: "Server is down");
              } else if (failure == const MainFailure.incorrectCredential()) {
                displaySnackBar(
                    context: context, text: "Account already exists");
              } else if (failure == const MainFailure.clientFailure()) {
                displaySnackBar(
                    context: context,
                    text: "Something wrong with your network");
              } else {
                displaySnackBar(
                    context: context, text: "Something Unexpected Happened");
              }
            }
          },
          (r) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => AccountDetailsScreen(
                password: '',
              ),
            ));
          },
        ),
      );
    }, builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: loadingWidget,
        );
      }
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SignUpImage(),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kwidth30,
                  AuthPageTitle(name: 'Sign up', fontsize: 43.w),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.w),
                child: EmailTextField(
                  icon: Icons.attachment_outlined,
                  text: 'Email ID',
                  color: Colors.grey,
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
                width: 420.w,
                height: 52.w,
                child: AuthButtonWidget(
                  title: "Verify",
                  bgcolor: Colors.black87,
                  tcolor: kwhite,
                  elevation: 5,
                  borderRadius: 8,
                  onclick: () {
                    BlocProvider.of<VerifyEmailAndSignUpWithGoogleCubit>(
                            context)
                        .verifyEmail(email: emailController.text);
                  },
                ),
              ),
              kheight20,
              const OrWidget(),
              kheight15,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: LoginWithGoogleWidget(
                  title: "Sign up with Google",
                  onClick: () {
                    BlocProvider.of<VerifyEmailAndSignUpWithGoogleCubit>(
                            context)
                        .signInWithGoogle();
                  },
                ),
              ),
              kheight10,
              SignUpButtonWidget(
                title: "Already a user?",
                buttonTitle: "Login",
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login', (route) => false);
                },
              )
            ],
          ),
        )),
      );
    }));
  }
}
