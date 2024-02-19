import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/create_password/widgets/confirm_password_text_field.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_top_title.dart';
import 'package:vcec/presentation/auth_screens/create_password/widgets/new_password_text_field.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_button_widget.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String? email;
  const CreatePasswordScreen({super.key, this.email});

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthTopTitleWidget(
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
                    if (controller.text.isEmpty || controller1.text.isEmpty) {
                      displaySnackBar(
                          context: context, text: "Fields must not be empty");
                      return;
                    }
                    if (controller.text != controller1.text) {
                      displaySnackBar(
                          context: context,
                          text: "Fields must be same 7012700723");
                      return;
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountDetailsScreen(
                        password: controller1.text,
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
