import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/application/gallery/gallery_individual_cubit.dart';
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart';
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart';
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart';
import 'package:vcec/application/notices/notices_cubit_cubit.dart';
import 'package:vcec/core/di/injectable.dart';
import 'package:vcec/presentation/home/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'V CEC',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
