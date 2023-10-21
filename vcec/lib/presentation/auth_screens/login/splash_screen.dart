import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/loggedIn/isloggedin_cubit.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final isloggedInCubit = context.read<IsloggedInCubit>();
    isloggedInCubit.loggedIn();
    return BlocListener<IsloggedInCubit, IsLoggedInState>(
      listener: (context, state) {
        print(state);
        if (state.page == 'home') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
