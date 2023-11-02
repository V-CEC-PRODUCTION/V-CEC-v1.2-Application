import 'dart:developer';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/email/email_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/create_password/widgets/confirm_password_text_field.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_top_title.dart';
import 'package:vcec/presentation/auth_screens/create_password/widgets/new_password_text_field.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String? email;
  CreatePasswordScreen({super.key, this.email});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);

    //String? password;

    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    AuthTopTitleWidget(
                      title: 'Create Password',
                    ),
                    NewPasswordTextFieldWidget(
                        obtext: obtext, controller: controller),
                    ConfirmPasswordTextFieldWidget(
                      controller1: controller1,
                      controller: controller,
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    SizedBox(
                      width: 413.w,
                      height: 60.w,
                      child: AuthButtonWidget(
                        title: 'Done',
                        bgcolor: auththeme,
                        tcolor: kblack,
                        elevation: 10,
                        borderRadius: 12,
                        onclick: () {
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
                                email: widget.email!,
                                password: controller1.text);
                          }
                          //  Navigator.of(context).push(MaterialPageRoute(
                          //    builder: (context) => AccountDetailsScreen(),
                          //  ));
                          // log(password.toString());
                        },
                      ),
                    ),
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
