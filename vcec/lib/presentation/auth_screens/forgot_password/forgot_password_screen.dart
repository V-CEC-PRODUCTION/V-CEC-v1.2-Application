import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/forgotpassword/forgotpassword_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_title_with_back.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotpasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (failure == const MainFailure.serverFailure()) {
                displaySnackBar(context: context, text: "Server is down");
              } else if (failure == const MainFailure.authFailure()) {
                displaySnackBar(
                    context: context, text: "Please check the email address");
              } else if (failure == const MainFailure.incorrectCredential()) {
                displaySnackBar(context: context, text: "Incorrect Password");
              } else if (failure == const MainFailure.clientFailure()) {
                displaySnackBar(
                    context: context,
                    text: "Something wrong with your network");
              } else {
                displaySnackBar(
                    context: context, text: "Something Unexpected Happened");
              }
            },
            (r) {
              Navigator.of(context).pop();
            },
          ),
        );
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              AuthTopTitleWithBackWidget(
                title: 'Forgot Password',
                fontSize: 40.w,
              ),
              SizedBox(
                height: 240.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: EmailTextField(
                  icon: Icons.attachment_outlined,
                  text: 'Email ID',
                  color: Colors.grey,
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              SizedBox(
                height: 70.h,
                width: 400.w,
                child: AuthButtonWidget(
                    title: "Send password reset email",
                    bgcolor: auththeme,
                    tcolor: kblack,
                    onclick: () {
                      BlocProvider.of<ForgotpasswordCubit>(context)
                          .postPassword(email: emailController.text);
                    },
                    elevation: 10,
                    borderRadius: 8),
              )
            ],
          ),
        )),
      ),
    );
  }
}
