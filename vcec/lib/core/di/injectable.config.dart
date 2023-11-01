// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i18;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/adduser/adduser_cubit.dart' as _i40;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i44;
import 'package:vcec/application/email/email_cubit.dart' as _i45;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i46;
import 'package:vcec/application/gallery/gallery_individual_cubit.dart' as _i47;
import 'package:vcec/application/google/google_cubit.dart' as _i48;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i43;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i49;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i35;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i50;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i51;
import 'package:vcec/application/user/user_cubit.dart' as _i52;
import 'package:vcec/application/verification/verification_cubit.dart' as _i53;
import 'package:vcec/domain/auth/google_service1.dart' as _i41;
import 'package:vcec/domain/auth/otp_service.dart' as _i27;
import 'package:vcec/domain/auth/verification_service.dart' as _i38;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i5;
import 'package:vcec/domain/departments/search/search_service.dart' as _i9;
import 'package:vcec/domain/email/email_service.dart' as _i11;
import 'package:vcec/domain/email/login_google_service.dart' as _i21;
import 'package:vcec/domain/email/login_service.dart' as _i23;
import 'package:vcec/domain/email/sign_in_google_service.dart' as _i29;
import 'package:vcec/domain/gallery/gallery_pressed_service.dart' as _i14;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i16;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i7;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i19;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i33;
import 'package:vcec/domain/notices/notices_service.dart' as _i25;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i31;
import 'package:vcec/domain/user/add_user_service.dart' as _i3;
import 'package:vcec/domain/user/user_service.dart' as _i36;
import 'package:vcec/infrastructure/auth/google_repo.dart' as _i42;
import 'package:vcec/infrastructure/auth/otp_repo.dart' as _i28;
import 'package:vcec/infrastructure/auth/verification_repo.dart' as _i39;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i6;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i54;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i10;
import 'package:vcec/infrastructure/email/email_repo.dart' as _i12;
import 'package:vcec/infrastructure/email/login_google_repo.dart' as _i22;
import 'package:vcec/infrastructure/email/login_repo.dart' as _i24;
import 'package:vcec/infrastructure/email/sign_in_google_repo.dart' as _i30;
import 'package:vcec/infrastructure/gallery/gallery_pressed_repository.dart'
    as _i15;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i17;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i8;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i20;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i34;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i26;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i32;
import 'package:vcec/infrastructure/user_role/add_user.dart' as _i4;
import 'package:vcec/infrastructure/user_role/user.dart' as _i37;

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
    gh.lazySingleton<_i3.AddUserService>(() => _i4.AddUserRepo());
    gh.lazySingleton<_i5.AuthTokenService>(() => _i6.AuthTokenRepo());
    gh.lazySingleton<_i7.CarouselService>(() => _i8.CarouselRepository());
    gh.lazySingleton<_i9.DepartmentSearchService>(
        () => _i10.DepartmentSearchRepo());
    gh.lazySingleton<_i11.EmailService>(() => _i12.EmailRepo());
    gh.lazySingleton<_i13.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i14.GalleryPressedService>(
        () => _i15.GalleryRepository());
    gh.lazySingleton<_i16.GalleryService>(() => _i17.GalleryRepository());
    gh.lazySingleton<_i18.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i19.HighlightsService>(() => _i20.HighlightsRepo());
    gh.lazySingleton<_i21.LogInGoogleService>(() => _i22.LoginInGoogleRepo());
    gh.lazySingleton<_i23.LoginService>(() => _i24.LoginRepo());
    gh.lazySingleton<_i25.NoticesService>(() => _i26.NoticesRepo());
    gh.lazySingleton<_i27.OtpService>(() => _i28.OtpRepository());
    gh.lazySingleton<_i29.SignInGoogleService>(() => _i30.SignInGoogleRepo());
    gh.lazySingleton<_i31.SplashScreenService>(() => _i32.SplashScreenRepo());
    gh.lazySingleton<_i33.TimeTableService>(() => _i34.TimeTableRespository());
    gh.factory<_i35.TimetableCubit>(
        () => _i35.TimetableCubit(gh<_i33.TimeTableService>()));
    gh.lazySingleton<_i36.UserService>(() => _i37.UserRepo());
    gh.lazySingleton<_i38.VerificationService>(
        () => _i39.VerificationRepository());
    gh.factory<_i40.AddUserCubit>(
        () => _i40.AddUserCubit(gh<_i3.AddUserService>()));
    gh.factory<_i41.Authservice>(() => _i42.AuthRepository(
          gh<_i18.GoogleSignIn>(),
          gh<_i13.FirebaseAuth>(),
        ));
    gh.factory<_i43.CarouselCubit>(
        () => _i43.CarouselCubit(gh<_i7.CarouselService>()));
    gh.factory<_i44.DepartmentSearchCubit>(
        () => _i44.DepartmentSearchCubit(gh<_i9.DepartmentSearchService>()));
    gh.factory<_i45.EmailCubit>(() => _i45.EmailCubit(
          gh<_i11.EmailService>(),
          gh<_i36.UserService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i46.GalleryCubit>(
        () => _i46.GalleryCubit(gh<_i16.GalleryService>()));
    gh.factory<_i47.GalleryIndividualCubit>(
        () => _i47.GalleryIndividualCubit(gh<_i14.GalleryPressedService>()));
    gh.factory<_i48.GoogleCubit>(() => _i48.GoogleCubit(
          gh<_i41.Authservice>(),
          gh<_i27.OtpService>(),
          gh<_i23.LoginService>(),
          gh<_i29.SignInGoogleService>(),
          gh<_i36.UserService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i49.HighlightsCubit>(
        () => _i49.HighlightsCubit(gh<_i19.HighlightsService>()));
    gh.factory<_i50.NoticesCubit>(
        () => _i50.NoticesCubit(gh<_i25.NoticesService>()));
    gh.factory<_i51.SplashScreenCubit>(() => _i51.SplashScreenCubit(
          gh<_i31.SplashScreenService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i52.UserCubit>(() => _i52.UserCubit(
          gh<_i41.Authservice>(),
          gh<_i23.LoginService>(),
          gh<_i21.LogInGoogleService>(),
        ));
    gh.factory<_i53.VerificationCubit>(
        () => _i53.VerificationCubit(gh<_i38.VerificationService>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i54.FirebaseInjectableModule {}
