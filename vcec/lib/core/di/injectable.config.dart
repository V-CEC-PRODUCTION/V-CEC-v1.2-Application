// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i29;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i30;
import 'package:vcec/application/login/login_cubit.dart' as _i33;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i32;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i27;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i31;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i25;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i34;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i28;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i26;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i35;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i3;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i15;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i19;
import 'package:vcec/domain/departments/search/search_service.dart' as _i7;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i10;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i5;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i13;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i23;
import 'package:vcec/domain/notices/notices_service.dart' as _i17;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i21;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i4;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i16;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i20;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i36;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i8;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i11;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i6;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i14;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i24;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i18;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i22;

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
    gh.lazySingleton<_i10.GalleryService>(() => _i11.GalleryRepository());
    gh.lazySingleton<_i12.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i13.HighlightsService>(() => _i14.HighlightsRepo());
    gh.lazySingleton<_i15.LoginService>(() => _i16.LoginRepo());
    gh.lazySingleton<_i17.NoticesService>(() => _i18.NoticesRepo());
    gh.lazySingleton<_i19.SignupService>(() => _i20.SignupRepo(
          gh<_i9.FirebaseAuth>(),
          gh<_i12.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i21.SplashScreenService>(() => _i22.SplashScreenRepo());
    gh.lazySingleton<_i23.TimeTableService>(() => _i24.TimeTableRespository());
    gh.factory<_i25.TimetableCubit>(
        () => _i25.TimetableCubit(gh<_i23.TimeTableService>()));
    gh.factory<_i26.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i26.VerifyEmailAndSignUpWithGoogleCubit(gh<_i19.SignupService>()));
    gh.factory<_i27.CarouselCubit>(
        () => _i27.CarouselCubit(gh<_i5.CarouselService>()));
    gh.factory<_i28.CreateNewAccountCubit>(() => _i28.CreateNewAccountCubit(
          gh<_i19.SignupService>(),
          gh<_i3.AuthTokenService>(),
        ));
    gh.factory<_i29.DepartmentSearchCubit>(
        () => _i29.DepartmentSearchCubit(gh<_i7.DepartmentSearchService>()));
    gh.factory<_i30.GalleryCubit>(
        () => _i30.GalleryCubit(gh<_i10.GalleryService>()));
    gh.factory<_i31.HighlightsCubit>(
        () => _i31.HighlightsCubit(gh<_i13.HighlightsService>()));
    gh.factory<_i32.LogOutCubit>(() => _i32.LogOutCubit(
          gh<_i19.SignupService>(),
          gh<_i3.AuthTokenService>(),
        ));
    gh.factory<_i33.LoginWithEmailAndGoogleCubit>(
        () => _i33.LoginWithEmailAndGoogleCubit(
              gh<_i15.LoginService>(),
              gh<_i3.AuthTokenService>(),
              gh<_i19.SignupService>(),
            ));
    gh.factory<_i34.NoticesCubit>(
        () => _i34.NoticesCubit(gh<_i17.NoticesService>()));
    gh.factory<_i35.SplashScreenCubit>(() => _i35.SplashScreenCubit(
          gh<_i21.SplashScreenService>(),
          gh<_i3.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i36.FirebaseInjectableModule {}
