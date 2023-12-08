import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';

import 'package:vcec/presentation/auth_screens/login/widgets/forgot_password_button.dart';
import 'package:vcec/presentation/auth_screens/login/widgets/login_image.dart';
import 'package:vcec/presentation/auth_screens/login/widgets/password_textfield.dart';
import 'package:vcec/presentation/auth_screens/login/widgets/signup_button.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_page_title.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/auth_screens/widgets/login_with_google.dart';
import 'package:vcec/presentation/auth_screens/widgets/or_widget.dart';
import 'package:vcec/application/login/login_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emaiController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);
    final size1 = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: BlocConsumer<LoginWithEmailAndGoogleCubit,
            LoginWithEmailAndGoogleState>(listener: (context, state) {
      state.isFailureOrSuccess.fold(
        () {},
        (either) => either.fold(
          (failure) {
            if (!state.isLoading) {
              if (failure ==const MainFailure.serverFailure()) {
                displaySnackBar(context: context, text: "Server is down");
              } else if (failure ==const MainFailure.authFailure()) {
                displaySnackBar(
                    context: context, text: "Please check the email address");
              } else if (failure ==const MainFailure.incorrectCredential()) {
                displaySnackBar(context: context, text: "Incorrect Password");
              } else if (failure == const MainFailure.clientFailure()) {
                displaySnackBar(
                    context: context,
                    text: "Something wrong with your network");
              } else {
                displaySnackBar(context: context, text: "Something Unexpected Happened");
              }
            }
          },
          (r) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          },
        ),
      );
       state.isFailureOrSuccessForGoogle.fold(
        () {},
        (either) => either.fold(
          (failure) {
            if (!state.isLoading) {
              if (failure ==const MainFailure.serverFailure()) {
                displaySnackBar(context: context, text: "Server is down");
              } else if (failure ==const MainFailure.authFailure()) {
                displaySnackBar(
                    context: context, text: "Please check the email address");
              } else if (failure ==const MainFailure.incorrectCredential()) {
                displaySnackBar(context: context, text: "Incorrect Password");
              } else if (failure == const MainFailure.clientFailure()) {
                displaySnackBar(
                    context: context,
                    text: "Something wrong with your network");
              } else {
                displaySnackBar(context: context, text: "Something Unexpected Happened");
              }
            }
          },
          (r) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          },
        ),
      );
    }, builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: loadingWidget,
        );
      }
      return SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            const LoginImageWidget(),
            Container(
                height: 672.w,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size1 * 0.32),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 110.h, left: 33.6.w, right: 33.5.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthPageTitle(name: 'Login', fontsize: 40),
                        EmailTextField(
                          icon: Icons.attachment_outlined,
                          text: 'Email ID',
                          color: Colors.grey,
                          controller: emaiController,
                        ),
                        PasswordTextFieldWidget(
                            obtext: obtext, controller1: passwordController),
                      const  ForgotPasswordWidget(),
                        SizedBox(
                            width: size1 * 0.85,
                            height: size1 * 0.11,
                            child: AuthButtonWidget(
                              title: "Login",
                              bgcolor: const Color.fromRGBO(46, 49, 54, 1),
                              tcolor: kwhite,
                              borderRadius: 4,
                              elevation: 5,
                              onclick: () {
                                BlocProvider.of<LoginWithEmailAndGoogleCubit>(
                                        context)
                                    .loginWithEmailAndPass(emaiController.text,
                                        passwordController.text);
                              },
                            )),
                        kheight20,
                        const OrWidget(),
                        kheight15,
                        LoginWithGoogleWidget(
                            onClick: () {
                              BlocProvider.of<LoginWithEmailAndGoogleCubit>(
                                      context)
                                  .loginWithGoogle();
                            },
                            title: 'Login with Google'),
                        kheight15,
                        SignUpButtonWidget(
                            title: 'New to V CEC ?',
                            buttonTitle: 'Sign Up',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>const SignUpScreen()));
                            }),
                      ],
                    ),
                  ),
                ))
          ]),
        ),
      );
    }));
  }
}
