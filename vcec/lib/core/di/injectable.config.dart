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
import 'package:vcec/application/adduser/adduser_cubit.dart' as _i44;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i48;
import 'package:vcec/application/email/email_cubit.dart' as _i49;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i50;
import 'package:vcec/application/gallery/gallery_individual_cubit.dart' as _i51;
import 'package:vcec/application/google/google_cubit.dart' as _i52;
import 'package:vcec/application/loggedIn/isloggedin_cubit.dart' as _i54;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i47;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i53;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i37;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i55;
import 'package:vcec/application/user/user_cubit.dart' as _i56;
import 'package:vcec/application/verification/verification_cubit.dart' as _i57;
import 'package:vcec/domain/auth/google_service1.dart' as _i45;
import 'package:vcec/domain/auth/otp_service.dart' as _i29;
import 'package:vcec/domain/auth/verification_service.dart' as _i42;
import 'package:vcec/domain/departments/search/search_service.dart' as _i9;
import 'package:vcec/domain/email/email_service.dart' as _i11;
import 'package:vcec/domain/email/login_google_service.dart' as _i23;
import 'package:vcec/domain/email/login_service.dart' as _i25;
import 'package:vcec/domain/email/sign_in_google_service.dart' as _i33;
import 'package:vcec/domain/gallery/gallery_pressed_service.dart' as _i14;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i16;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i7;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i19;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i35;
import 'package:vcec/domain/notices/notices_service.dart' as _i27;
import 'package:vcec/domain/user/add_user_service.dart' as _i3;
import 'package:vcec/domain/user/auth_service.dart' as _i5;
import 'package:vcec/domain/user/request_service.dart' as _i31;
import 'package:vcec/domain/user/user_logged_in_service.dart' as _i21;
import 'package:vcec/domain/user/user_service.dart' as _i38;
import 'package:vcec/domain/user/validate_service.dart' as _i40;
import 'package:vcec/infrastructure/auth/google_repo.dart' as _i46;
import 'package:vcec/infrastructure/auth/otp_repo.dart' as _i30;
import 'package:vcec/infrastructure/auth/verification_repo.dart' as _i43;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i58;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i10;
import 'package:vcec/infrastructure/email/email_repo.dart' as _i12;
import 'package:vcec/infrastructure/email/login_google_repo.dart' as _i24;
import 'package:vcec/infrastructure/email/login_repo.dart' as _i26;
import 'package:vcec/infrastructure/email/sign_in_google_repo.dart' as _i34;
import 'package:vcec/infrastructure/gallery/gallery_pressed_repository.dart'
    as _i15;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i17;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i8;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i20;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i36;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i28;
import 'package:vcec/infrastructure/user_role/add_user.dart' as _i4;
import 'package:vcec/infrastructure/user_role/auth_repo.dart' as _i6;
import 'package:vcec/infrastructure/user_role/request.dart' as _i32;
import 'package:vcec/infrastructure/user_role/user.dart' as _i39;
import 'package:vcec/infrastructure/user_role/user_logged_in_repo.dart' as _i22;
import 'package:vcec/infrastructure/user_role/validate.dart' as _i41;

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
    gh.lazySingleton<_i5.AuthService>(() => _i6.AuthRepo());
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
    gh.lazySingleton<_i21.IsUserService>(() => _i22.IsUserRepo());
    gh.lazySingleton<_i23.LogInGoogleService>(() => _i24.LoginInGoogleRepo());
    gh.lazySingleton<_i25.LoginService>(() => _i26.LoginRepo());
    gh.lazySingleton<_i27.NoticesService>(() => _i28.NoticesRepo());
    gh.lazySingleton<_i29.OtpService>(() => _i30.OtpRepository());
    gh.lazySingleton<_i31.RequestService>(() => _i32.RequestRepo());
    gh.lazySingleton<_i33.SignInGoogleService>(() => _i34.SignInGoogleRepo());
    gh.lazySingleton<_i35.TimeTableService>(() => _i36.TimeTableRespository());
    gh.factory<_i37.TimetableCubit>(
        () => _i37.TimetableCubit(gh<_i35.TimeTableService>()));
    gh.lazySingleton<_i38.UserService>(() => _i39.UserRepo());
    gh.lazySingleton<_i40.ValidateService>(() => _i41.ValidateRepo());
    gh.lazySingleton<_i42.VerificationService>(
        () => _i43.VerificationRepository());
    gh.factory<_i44.AddUserCubit>(
        () => _i44.AddUserCubit(gh<_i3.AddUserService>()));
    gh.factory<_i45.Authservice>(() => _i46.AuthRepository(
          gh<_i18.GoogleSignIn>(),
          gh<_i13.FirebaseAuth>(),
        ));
    gh.factory<_i47.CarouselCubit>(
        () => _i47.CarouselCubit(gh<_i7.CarouselService>()));
    gh.factory<_i48.DepartmentSearchCubit>(
        () => _i48.DepartmentSearchCubit(gh<_i9.DepartmentSearchService>()));
    gh.factory<_i49.EmailCubit>(() => _i49.EmailCubit(
          gh<_i11.EmailService>(),
          gh<_i38.UserService>(),
          gh<_i31.RequestService>(),
        ));
    gh.factory<_i50.GalleryCubit>(
        () => _i50.GalleryCubit(gh<_i16.GalleryService>()));
    gh.factory<_i51.GalleryIndividualCubit>(
        () => _i51.GalleryIndividualCubit(gh<_i14.GalleryPressedService>()));
    gh.factory<_i52.GoogleCubit>(() => _i52.GoogleCubit(
          gh<_i45.Authservice>(),
          gh<_i29.OtpService>(),
          gh<_i25.LoginService>(),
          gh<_i33.SignInGoogleService>(),
          gh<_i38.UserService>(),
          gh<_i31.RequestService>(),
        ));
    gh.factory<_i53.HighlightsCubit>(
        () => _i53.HighlightsCubit(gh<_i19.HighlightsService>()));
    gh.factory<_i54.IsloggedInCubit>(() => _i54.IsloggedInCubit(
          gh<_i21.IsUserService>(),
          gh<_i40.ValidateService>(),
          gh<_i31.RequestService>(),
          gh<_i5.AuthService>(),
        ));
    gh.factory<_i55.NoticesCubit>(
        () => _i55.NoticesCubit(gh<_i27.NoticesService>()));
    gh.factory<_i56.UserCubit>(() => _i56.UserCubit(
          gh<_i45.Authservice>(),
          gh<_i25.LoginService>(),
          gh<_i23.LogInGoogleService>(),
        ));
    gh.factory<_i57.VerificationCubit>(
        () => _i57.VerificationCubit(gh<_i42.VerificationService>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i58.FirebaseInjectableModule {}
