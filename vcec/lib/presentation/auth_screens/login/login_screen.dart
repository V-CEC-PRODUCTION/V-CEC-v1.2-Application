import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/login/login_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/auth_screens/widgets/auth_page_title.dart';
import 'package:vcec/presentation/auth_screens/widgets/email_text_field.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';
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
    void passwordVisibility() {
      obtext.value = !obtext.value;
    }

    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == MainFailure.authFailure()) {
                  displaySnackBar(
                      context: context, text: "Please check the email address");
                } else if (failure == MainFailure.incorrectCredential()) {
                  displaySnackBar(context: context, text: "Incorrect Password");
                } else {
                  displaySnackBar(
                      context: context, text: "Somthing went wrong");
                }
              }
            },
            (r) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (route) => false);
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
            child: SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/login_image.jpg'),
                        fit: BoxFit.fitWidth),
                  ),
                  height: 480.w,
                  width: 480.w,
                ),
              ),
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
                        Row(
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
                                      controller: passwordController,
                                      obscureText: !value,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
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
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size1 * 0.85,
                          height: size1 * 0.11,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LoginCubit>(context)
                                  .loginWithEmailAndPass(emaiController.text,
                                      passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 4,
                                backgroundColor:
                                    const Color.fromRGBO(46, 49, 54, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(size1 * 0.02))),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: size1 * 0.045, color: Colors.white),
                            ),
                          ),
                        ),
                        kheight15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: size1 * 0.32,
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
                              width: size1 * 0.32,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        kheight15,
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 4,
                              backgroundColor:
                                  const Color.fromARGB(255, 238, 238, 238),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(size1 * 0.02))),
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
                                width: size1 * 0.06,
                                height: size1 * 0.06,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: size1 * 0.07),
                                child: Text(
                                  'Login with Google',
                                  style: TextStyle(
                                      fontSize: size1 * 0.045,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kheight15,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New to V CEC ?',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size1 * 1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
      },
    ));
  }
}
