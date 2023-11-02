import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/google/google_cubit.dart';
//import 'package:vcec/application/signingoogle/signingoogle_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/login/widgets/signup_button.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/sign_up/widget/signup_image.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_page_title.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/auth_screens/widgets/login_with_google.dart';
import 'package:vcec/presentation/auth_screens/widgets/or_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleCubit, GoogleState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      listener: (context, state) {
        state.otpFailureOrSuccess.fold(
            () {},
            (r) => r.fold((l) {}, (r) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OtpVerificationScreen(
                      otp: r.otp!,
                      email: controller.text,
                    ),
                  ));
                }));
        state.authfailureorsuccess.fold(
            () {},
            (a) => a.fold(
                  (l) {},
                  (r) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountDetailsScreen(
                        deviceId: state.deviceId,
                      ),
                    ));
                  },
                ));
      },
      builder: (context, state) {
        if (state.loading == false) {
          return const Scaffold(
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
                  const SignUpImage(),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                      ),
                      AuthPageTitle(name: 'Sign up', fontsize: 43.w),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, top: 25.w),
                    child: EmailTextField(
                      icon: Icons.attachment_outlined,
                      text: 'Email ID',
                      color: Colors.grey,
                      controller: controller,
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
                          context
                              .read<GoogleCubit>()
                              .postEmail(email: controller.text);
                        }),
                  ),
                  kheight20,
                  const OrWidget(),
                  kheight15,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: LoginWithGoogleWidget(
                      title: "Sign up with Google",
                      onClick: () {
                        final ocubit = context.read<GoogleCubit>();
                        ocubit.googleSignIn();
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
        }
      },
    );
  }
}
