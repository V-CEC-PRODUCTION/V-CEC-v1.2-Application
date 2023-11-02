import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/user/user_cubit.dart';
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
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);
    final size1 = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
          listenWhen: (previous, current) => previous.value != current.value,
          listener: (context, state) {
            state.authfailureorsuccess.fold(
                () {},
                (a) => a.fold(
                      (l) {},
                      (r) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      },
                    ));
            state.FailureOrSuccess.fold(
                () {},
                (a) => a.fold(
                      (l) {},
                      (r) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      },
                    ));
          },
          builder: (context, state) {
            if (state.loading == false) {
              return const Center(
                child: loadingWidget,
              );
            } else {
              return SizedBox(
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
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
                        padding: EdgeInsets.only(
                            top: 110.h, left: 33.6.w, right: 33.5.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AuthPageTitle(name: 'Login', fontsize: 40),
                              EmailTextField(
                                icon: Icons.attachment_outlined,
                                text: 'Email ID',
                                color: Colors.grey,
                                controller: controller,
                              ),
                              PasswordTextFieldWidget(
                                  obtext: obtext, controller1: controller1),
                              ForgotPasswordWidget(),
                              SizedBox(
                                  width: size1 * 0.85,
                                  height: size1 * 0.11,
                                  child: AuthButtonWidget(
                                    title: "Login",
                                    bgcolor:
                                        const Color.fromRGBO(46, 49, 54, 1),
                                    tcolor: kwhite,
                                    borderRadius: 4,
                                    elevation: 5,
                                    onclick: () {
                                      final gcubit = context.read<UserCubit>();
                                      gcubit.login(
                                          email: controller.text,
                                          password: controller1.text);
                                    },
                                  )),
                              kheight20,
                              const OrWidget(),
                              kheight15,
                              LoginWithGoogleWidget(
                                  onClick: () {
                                    context.read<UserCubit>().googleSignIn();
                                  },
                                  title: 'Login with Google'),
                              kheight15,
                              SignUpButtonWidget(
                                  title: 'New to V CEC ?',
                                  buttonTitle: 'Sign Up',
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
