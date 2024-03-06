import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController leftAnimation;
  late final CurvedAnimation leftCurvedAnimation;
  late final AnimationController rightAnimation;
  late final CurvedAnimation rightCurvedAnimation;

  @override
  void initState() {
    leftAnimation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600),
        lowerBound: 0,
        upperBound: 1);
    leftCurvedAnimation = CurvedAnimation(
      parent: leftAnimation,
      curve: Curves.fastOutSlowIn,
    );

    rightAnimation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600),
        lowerBound: 0,
        upperBound: 1);
    rightCurvedAnimation = CurvedAnimation(
      parent: rightAnimation,
      curve: Curves.fastOutSlowIn,
    );
    leftAnimation.forward();
    rightAnimation.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<SplashScreenCubit>(context).loggedIn();
    });

    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        if (state.page.isNotEmpty) {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) =>
                state.page == '/login' ? const LoginPage() : const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ));
        }
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: rightCurvedAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          -62 * rightCurvedAnimation.value + 80,
                          53 * rightCurvedAnimation.value - 80,
                        ),
                        child: Opacity(
                          opacity: rightCurvedAnimation.value < 0.5
                              ? rightCurvedAnimation.value * 2
                              : 1,
                          child: Image(
                            image:
                                AssetImage('assets/img/splash/logo_right.png'),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: leftCurvedAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          102 * leftCurvedAnimation.value - 120,
                          150 * leftCurvedAnimation.value - 150,
                        ),
                        child: Opacity(
                          opacity: leftCurvedAnimation.value < 0.5
                              ? leftCurvedAnimation.value * 2
                              : 1,
                          child: Image(
                            image:
                                AssetImage('assets/img/splash/logo_left.png'),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              kheight30,
              AnimatedBuilder(
                  animation: leftCurvedAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: leftCurvedAnimation.value > 0.5
                          ? leftCurvedAnimation.value * 2 - 1
                          : 0,
                      child: Transform.translate(
                        offset: Offset(0, -40 * leftCurvedAnimation.value + 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image:
                                  AssetImage('assets/img/splash/c_letter.png'),
                              width: 50,
                              height: 50,
                            ),
                            Image(
                              image:
                                  AssetImage('assets/img/splash/e_letter.png'),
                              width: 50,
                              height: 50,
                            ),
                            Image(
                              image: AssetImage(
                                  'assets/img/splash/c_letter_2.png'),
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
