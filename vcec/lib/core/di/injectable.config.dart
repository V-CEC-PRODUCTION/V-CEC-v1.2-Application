// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i27;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i28;
import 'package:vcec/application/gallery/gallery_individual_cubit.dart' as _i29;
import 'package:vcec/application/google/google_cubit.dart' as _i30;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i26;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i31;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i21;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i32;
import 'package:vcec/application/otp/otp_cubit.dart' as _i33;
import 'package:vcec/application/verification/verification_cubit.dart' as _i34;
import 'package:vcec/domain/auth/google_service.dart' as _i24;
import 'package:vcec/domain/auth/otp_service.dart' as _i17;
import 'package:vcec/domain/auth/verification_service.dart' as _i22;
import 'package:vcec/domain/departments/search/search_service.dart' as _i5;
import 'package:vcec/domain/gallery/gallery_pressed_service.dart' as _i8;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i10;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i3;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i13;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i19;
import 'package:vcec/domain/notices/notices_service.dart' as _i15;
import 'package:vcec/infrastructure/auth/google_repo.dart' as _i25;
import 'package:vcec/infrastructure/auth/otp_repo.dart' as _i18;
import 'package:vcec/infrastructure/auth/verification_repo.dart' as _i23;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i35;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i6;
import 'package:vcec/infrastructure/gallery/gallery_pressed_repository.dart'
    as _i9;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i11;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i4;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i14;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i20;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.CarouselService>(() => _i4.CarouselRepository());
    gh.lazySingleton<_i5.DepartmentSearchService>(
        () => _i6.DepartmentSearchRepo());
    gh.lazySingleton<_i7.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i8.GalleryPressedService>(() => _i9.GalleryRepository());
    gh.lazySingleton<_i10.GalleryService>(() => _i11.GalleryRepository());
    gh.lazySingleton<_i12.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i13.HighlightsService>(() => _i14.HighlightsRepo());
    gh.lazySingleton<_i15.NoticesService>(() => _i16.NoticesRepo());
    gh.lazySingleton<_i17.OtpService>(() => _i18.OtpRepository());
    gh.lazySingleton<_i19.TimeTableService>(() => _i20.TimeTableRespository());
    gh.factory<_i21.TimetableCubit>(
        () => _i21.TimetableCubit(gh<_i19.TimeTableService>()));
    gh.lazySingleton<_i22.VerificationService>(
        () => _i23.VerificationRepository());
    gh.factory<_i24.Authservice>(() => _i25.AuthRepository(
          gh<_i12.GoogleSignIn>(),
          gh<_i7.FirebaseAuth>(),
        ));
    gh.factory<_i26.CarouselCubit>(
        () => _i26.CarouselCubit(gh<_i3.CarouselService>()));
    gh.factory<_i27.DepartmentSearchCubit>(
        () => _i27.DepartmentSearchCubit(gh<_i5.DepartmentSearchService>()));
    gh.factory<_i28.GalleryCubit>(
        () => _i28.GalleryCubit(gh<_i10.GalleryService>()));
    gh.factory<_i29.GalleryIndividualCubit>(
        () => _i29.GalleryIndividualCubit(gh<_i8.GalleryPressedService>()));
    gh.factory<_i30.GoogleCubit>(
        () => _i30.GoogleCubit(gh<_i24.Authservice>()));
    gh.factory<_i31.HighlightsCubit>(
        () => _i31.HighlightsCubit(gh<_i13.HighlightsService>()));
    gh.factory<_i32.NoticesCubit>(
        () => _i32.NoticesCubit(gh<_i15.NoticesService>()));
    gh.factory<_i33.OtpCubit>(() => _i33.OtpCubit(gh<_i17.OtpService>()));
    gh.factory<_i34.VerificationCubit>(
        () => _i34.VerificationCubit(gh<_i22.VerificationService>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i35.FirebaseInjectableModule {}
