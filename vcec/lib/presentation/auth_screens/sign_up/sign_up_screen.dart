import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/google/google_cubit.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/auth_screens/otp__verification/otp_verification_screen.dart';

import '../../../application/otp/otp_cubit.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeh = MediaQuery.of(context).size.height;
    final sizew = MediaQuery.of(context).size.width;
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) => previous.value != current.value  ,
      listener: (context, state) {
        state.otpFailureOrSuccess.fold(() {}, (r) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  OtpVerificationScreen(otp: state.otp!.otp!, email:controller.text , ),
          ));
        });
      },
      child: Scaffold(
        body: SafeArea(
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
                  TitleDetails(name: 'Sign up', fontsize: 35),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: sizew * 0.07, right: sizew * 0.05, top: sizew * 0.05),
                child: EmailPassWidget(
                  icon: Icons.attachment_outlined,
                  text: 'Email ID',
                  color: Colors.grey,
                  controller: controller,
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
                    context.read<OtpCubit>().postEmail(email: controller.text);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(sizew * 0.02)))),
                  child: Text(
                    'Verify',
                    style:
                        TextStyle(fontSize: sizew * 0.045, color: Colors.white),
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
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 221, 218, 218)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(sizew * 0.02)))),
                    child: GestureDetector(
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
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          BlocProvider.of<GoogleCubit>(context).googleSignIn();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
