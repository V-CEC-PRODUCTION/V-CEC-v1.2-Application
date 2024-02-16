import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/application/announcements/announcements_cubit.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart';
import 'package:vcec/application/events/events_cubit.dart';
import 'package:vcec/application/forgotpassword/forgotpassword_cubit.dart';
import 'package:vcec/application/forums/forums_cubit.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/application/indannouncements/indannouncements_cubit.dart';
import 'package:vcec/application/indeventscubit/indeventscubit_cubit.dart';
import 'package:vcec/application/login/login_cubit.dart';
import 'package:vcec/application/logout/log_out_cubit.dart';
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart';
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart';
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart';
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart';
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart';
import 'package:vcec/core/di/injectable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vcec/infrastructure/notification/notification_handle.dart';
import 'package:vcec/presentation/auth_screens/login/login_screen.dart';
import 'package:vcec/presentation/auth_screens/sign_up/sign_up_screen.dart';
import 'package:vcec/presentation/home/home.dart';
import 'package:vcec/presentation/splash_screen.dart/splash_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/verified_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationHandle().initiateAndListenNotification();
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
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
        BlocProvider<SplashScreenCubit>(
          create: (context) => getIt<SplashScreenCubit>(),
        ),
        BlocProvider<VerifyEmailAndSignUpWithGoogleCubit>(
          create: (context) => getIt<VerifyEmailAndSignUpWithGoogleCubit>(),
        ),
        BlocProvider<CreateNewAccountCubit>(
          create: (context) => getIt<CreateNewAccountCubit>(),
        ),
        BlocProvider<LoginWithEmailAndGoogleCubit>(
          create: (context) => getIt<LoginWithEmailAndGoogleCubit>(),
        ),
        BlocProvider<LogOutCubit>(
          create: (context) => getIt<LogOutCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider<EditProfileCubit>(
            create: (context) => getIt<EditProfileCubit>()),
        BlocProvider<EventsCubit>(
          create: (context) => getIt<EventsCubit>(),
        ),
        BlocProvider<ForumsCubit>(
          create: (context) => getIt<ForumsCubit>(),
        ),
        BlocProvider<AnnouncementCubit>(
          create: (context) => getIt<AnnouncementCubit>(),
        ),
        BlocProvider<IndEventsCubit>(
          create: (context) => getIt<IndEventsCubit>(),
        ),
        BlocProvider<IndAnnouncementsCubit>(
          create: (context) => getIt<IndAnnouncementsCubit>(),
        ),
        BlocProvider<ForgotpasswordCubit>(
          create: (context) => getIt<ForgotpasswordCubit>(),
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
              initialRoute: '/home',
              routes: {
                '/': (context) => const SplashScreen(),
                '/login': (context) => const LoginPage(),
                '/signup': (context) => const SignUpScreen(),
                '/home': (context) => HomeScreen(),
                '/otp_verification': (context) => OtpVerificationScreen(),
                '/otp_verified': (context) => const VerifiedScreen(),
              },
              navigatorKey: navigatorKey,
            );
          }),
    );
  }
}
