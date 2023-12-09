// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i33;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i34;
import 'package:vcec/application/gallery/gallery_individual_cubit.dart' as _i35;
import 'package:vcec/application/login/login_cubit.dart' as _i38;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i37;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i31;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i36;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i29;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i39;
import 'package:vcec/application/profile/profile_cubit.dart' as _i40;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i32;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i30;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i41;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i3;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i17;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i23;
import 'package:vcec/domain/departments/search/search_service.dart' as _i7;
import 'package:vcec/domain/gallery/gallery_pressed_service.dart' as _i10;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i12;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i5;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i15;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i27;
import 'package:vcec/domain/notices/notices_service.dart' as _i19;
import 'package:vcec/domain/profile/profile_service/profile_service.dart'
    as _i21;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i25;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i4;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i18;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i24;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i42;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i8;
import 'package:vcec/infrastructure/gallery/gallery_pressed_repository.dart'
    as _i11;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i13;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i6;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i16;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i28;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i20;
import 'package:vcec/infrastructure/profile/profile_repo.dart' as _i22;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i26;

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
    gh.lazySingleton<_i3.AuthTokenService>(() => _i4.AuthTokenRepo());
    gh.lazySingleton<_i5.CarouselService>(() => _i6.CarouselRepository());
    gh.lazySingleton<_i7.DepartmentSearchService>(
        () => _i8.DepartmentSearchRepo());
    gh.lazySingleton<_i9.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i10.GalleryPressedService>(
        () => _i11.GalleryRepository());
    gh.lazySingleton<_i12.GalleryService>(() => _i13.GalleryRepository());
    gh.lazySingleton<_i14.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i15.HighlightsService>(() => _i16.HighlightsRepo());
    gh.lazySingleton<_i17.LoginService>(() => _i18.LoginRepo());
    gh.lazySingleton<_i19.NoticesService>(() => _i20.NoticesRepo());
    gh.lazySingleton<_i21.ProfileService>(() => _i22.ProfileRepo());
    gh.lazySingleton<_i23.SignupService>(() => _i24.SignupRepo(
          gh<_i9.FirebaseAuth>(),
          gh<_i14.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i25.SplashScreenService>(() => _i26.SplashScreenRepo());
    gh.lazySingleton<_i27.TimeTableService>(() => _i28.TimeTableRespository());
    gh.factory<_i29.TimetableCubit>(
        () => _i29.TimetableCubit(gh<_i27.TimeTableService>()));
    gh.factory<_i30.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i30.VerifyEmailAndSignUpWithGoogleCubit(gh<_i23.SignupService>()));
    gh.factory<_i31.CarouselCubit>(
        () => _i31.CarouselCubit(gh<_i5.CarouselService>()));
    gh.factory<_i32.CreateNewAccountCubit>(() => _i32.CreateNewAccountCubit(
          gh<_i23.SignupService>(),
          gh<_i3.AuthTokenService>(),
        ));
    gh.factory<_i33.DepartmentSearchCubit>(
        () => _i33.DepartmentSearchCubit(gh<_i7.DepartmentSearchService>()));
    gh.factory<_i34.GalleryCubit>(
        () => _i34.GalleryCubit(gh<_i12.GalleryService>()));
    gh.factory<_i35.GalleryIndividualCubit>(
        () => _i35.GalleryIndividualCubit(gh<_i10.GalleryPressedService>()));
    gh.factory<_i36.HighlightsCubit>(
        () => _i36.HighlightsCubit(gh<_i15.HighlightsService>()));
    gh.factory<_i37.LogOutCubit>(() => _i37.LogOutCubit(
          gh<_i23.SignupService>(),
          gh<_i3.AuthTokenService>(),
        ));
    gh.factory<_i38.LoginWithEmailAndGoogleCubit>(
        () => _i38.LoginWithEmailAndGoogleCubit(
              gh<_i17.LoginService>(),
              gh<_i3.AuthTokenService>(),
              gh<_i23.SignupService>(),
            ));
    gh.factory<_i39.NoticesCubit>(
        () => _i39.NoticesCubit(gh<_i19.NoticesService>()));
    gh.factory<_i40.ProfileCubit>(
        () => _i40.ProfileCubit(gh<_i21.ProfileService>()));
    gh.factory<_i41.SplashScreenCubit>(() => _i41.SplashScreenCubit(
          gh<_i25.SplashScreenService>(),
          gh<_i3.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i42.FirebaseInjectableModule {}
