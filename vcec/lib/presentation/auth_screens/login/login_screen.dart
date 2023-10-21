import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/google/google_cubit.dart';
//import 'package:vcec/application/signingoogle/signingoogle_cubit.dart';
import 'package:vcec/application/user/user_cubit.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';
import 'package:vcec/presentation/home/home.dart';

class EmailPassWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const EmailPassWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.controller,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: text),
            controller: controller,
            validator: validator,
          ),
        ),
      ],
    );
  }
}

class TitleDetails extends StatelessWidget {
  final String name;
  final double fontsize;
  const TitleDetails({
    super.key,
    required this.name,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.bold),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obtext = ValueNotifier<bool>(false);
    final size1 = MediaQuery.of(context).size.width;
    void passwordVisibility() {
      obtext.value = !obtext.value;
    }

    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (previous, current) =>
          previous.value != current.value,
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
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black,
              body: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/login_image.jpg'),
                                fit: BoxFit.fitHeight),
                          ),
                          height: size1 * 0.8,
                          width: size1 * 4,
                        ),
                      ],
                    ),
                    Positioned(
                      child: Container(
                        height: size1 * 1.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(size1 * 0.32),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size1 * 0.25, right: size1 * 0.58),
                              child: const TitleDetails(
                                  name: 'Login', fontsize: 40),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size1 * 0.07,
                                  right: size1 * 0.05,
                                  top: size1 * 0.03),
                              child: EmailPassWidget(
                                icon: Icons.attachment_outlined,
                                text: 'Email ID',
                                color: Colors.grey,
                                controller: controller,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size1 * 0.07, right: size1 * 0.05),
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
                                            controller: controller1,
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size1 * 0.58),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              width: size1 * 0.85,
                              height: size1 * 0.11,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 4,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3))
                              ]),
                              child: ElevatedButton(
                                onPressed: () {
                                  final gcubit = context.read<UserCubit>();
                                  gcubit.login(
                                      email: controller.text,
                                      password: controller1.text);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.black),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                size1 * 0.02)))),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: size1 * 0.045,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size1 * 0.04),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size1 * 0.04),
                              child: Container(
                                width: size1 * 0.85,
                                height: size1 * 0.11,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 4,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3))
                                ]),
                                child: ElevatedButton(
                                  onPressed: () {
                                    final cubit = context.read<UserCubit>();
                                    cubit.googleSignIn();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromARGB(
                                                  255, 221, 218, 218)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size1 * 0.02)))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                        padding: EdgeInsets.only(
                                            right: size1 * 0.07),
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
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size1 * 0.3, top: size1 * 0.04),
                              child: Row(
                                children: [
                                  const Text(
                                    'New to V CEC ?',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
