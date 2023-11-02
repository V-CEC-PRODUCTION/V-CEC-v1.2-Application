import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/application/adduser/adduser_cubit.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/application/email/email_cubit.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/application/gallery/gallery_individual_cubit.dart';
import 'package:vcec/application/google/google_cubit.dart';
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart';
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart';
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart';
//import 'package:vcec/application/signingoogle/signingoogle_cubit.dart';
import 'package:vcec/application/user/user_cubit.dart';
import 'package:vcec/application/verification/verification_cubit.dart';
import 'package:vcec/core/di/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vcec/presentation/auth_screens/account_details/account_details_screen.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/verified_screen.dart';
import 'package:vcec/presentation/splash_screen.dart/splash_screen.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';
import 'package:vcec/presentation/home/home.dart';
//import 'package:vcec/presentation/notification/notification_screen.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarouselCubit>(
          create: (context) => getIt<CarouselCubit>(),
        ),
        BlocProvider<TimetableCubit>(
          create: (context) => getIt<TimetableCubit>(),
        ),
        BlocProvider<DepartmentSearchCubit>(
          create: (context) => getIt<DepartmentSearchCubit>(),
        ),
        BlocProvider<HighlightsCubit>(
          create: (context) => getIt<HighlightsCubit>(),
        ),
        BlocProvider<NoticesCubit>(
          create: (context) => getIt<NoticesCubit>(),
        ),
        BlocProvider<GalleryCubit>(
          create: (context) => getIt<GalleryCubit>(),
        ),
        BlocProvider<GalleryIndividualCubit>(
          create: (context) => getIt<GalleryIndividualCubit>(),
        ),
        BlocProvider<VerificationCubit>(
          create: (context) => getIt<VerificationCubit>(),
        ),
        BlocProvider<GoogleCubit>(
          create: (context) => getIt<GoogleCubit>(),
        ),
        BlocProvider<EmailCubit>(
          create: (context) => getIt<EmailCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (context) => getIt<UserCubit>(),
        ),
        BlocProvider<AddUserCubit>(
          create: (context) => getIt<AddUserCubit>(),
        ),
        BlocProvider<SplashScreenCubit>(
          create: (context) => getIt<SplashScreenCubit>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(480, 1019),
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'V CEC',
              theme: ThemeData(
                useMaterial3: true,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => AccountDetailsScreen(
                      deviceId: '',
                    ),
                '/login': (context) => LoginPage(),
                '/signup': (context) => SignUpScreen(),
                '/home': (context) => HomeScreen(),
              },
            );
          }),
    );
  }
}
