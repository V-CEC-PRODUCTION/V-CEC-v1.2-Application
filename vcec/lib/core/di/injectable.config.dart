// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i20;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/announcements/announcements_cubit.dart'
    as _i39;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i42;
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart' as _i43;
import 'package:vcec/application/events/events_cubit.dart' as _i44;
import 'package:vcec/application/forums/forums_cubit.dart' as _i45;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i46;
import 'package:vcec/application/login/login_cubit.dart' as _i49;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i48;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i40;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i47;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i35;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i50;
import 'package:vcec/application/profile/profile_cubit.dart' as _i51;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i41;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i38;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i52;
import 'package:vcec/domain/Announcements/announcements_service.dart' as _i3;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i5;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i23;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i29;
import 'package:vcec/domain/departments/search/search_service.dart' as _i9;
import 'package:vcec/domain/events/events_service.dart' as _i13;
import 'package:vcec/domain/events/forums/forums_service.dart' as _i16;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i18;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i7;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i21;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i33;
import 'package:vcec/domain/notices/notices_service.dart' as _i25;
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart'
    as _i11;
import 'package:vcec/domain/profile/profile_service/profile_service.dart'
    as _i27;
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart'
    as _i36;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i31;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i6;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i24;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i30;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i53;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i10;
import 'package:vcec/infrastructure/events/announcements_repository.dart'
    as _i4;
import 'package:vcec/infrastructure/events/events_repository.dart' as _i14;
import 'package:vcec/infrastructure/events/forums_repository.dart' as _i17;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i19;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i8;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i22;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i34;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i26;
import 'package:vcec/infrastructure/profile/edit_profile_repo.dart' as _i12;
import 'package:vcec/infrastructure/profile/profile_repo.dart' as _i28;
import 'package:vcec/infrastructure/profile/update_profile_img_repo.dart'
    as _i37;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i32;

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
    gh.lazySingleton<_i3.AnnouncementService>(
        () => _i4.AnnouncementRepository());
    gh.lazySingleton<_i5.AuthTokenService>(() => _i6.AuthTokenRepo());
    gh.lazySingleton<_i7.CarouselService>(() => _i8.CarouselRepository());
    gh.lazySingleton<_i9.DepartmentSearchService>(
        () => _i10.DepartmentSearchRepo());
    gh.lazySingleton<_i11.EditProfileService>(() => _i12.EditProfileRepo());
    gh.lazySingleton<_i13.EventsService>(() => _i14.EventsRepository());
    gh.lazySingleton<_i15.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i16.ForumsService>(() => _i17.ForumsRepository());
    gh.lazySingleton<_i18.GalleryService>(() => _i19.GalleryRepository());
    gh.lazySingleton<_i20.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i21.HighlightsService>(() => _i22.HighlightsRepo());
    gh.lazySingleton<_i23.LoginService>(() => _i24.LoginRepo());
    gh.lazySingleton<_i25.NoticesService>(() => _i26.NoticesRepo());
    gh.lazySingleton<_i27.ProfileService>(() => _i28.ProfileRepo());
    gh.lazySingleton<_i29.SignupService>(() => _i30.SignupRepo(
          gh<_i15.FirebaseAuth>(),
          gh<_i20.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i31.SplashScreenService>(() => _i32.SplashScreenRepo());
    gh.lazySingleton<_i33.TimeTableService>(() => _i34.TimeTableRespository());
    gh.factory<_i35.TimetableCubit>(
        () => _i35.TimetableCubit(gh<_i33.TimeTableService>()));
    gh.lazySingleton<_i36.UpdateProfileImgService>(
        () => _i37.UpdateProfileImgRepo());
    gh.factory<_i38.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i38.VerifyEmailAndSignUpWithGoogleCubit(gh<_i29.SignupService>()));
    gh.factory<_i39.AnnouncementCubit>(
        () => _i39.AnnouncementCubit(gh<_i3.AnnouncementService>()));
    gh.factory<_i40.CarouselCubit>(
        () => _i40.CarouselCubit(gh<_i7.CarouselService>()));
    gh.factory<_i41.CreateNewAccountCubit>(() => _i41.CreateNewAccountCubit(
          gh<_i29.SignupService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i42.DepartmentSearchCubit>(
        () => _i42.DepartmentSearchCubit(gh<_i9.DepartmentSearchService>()));
    gh.factory<_i43.EditProfileCubit>(() => _i43.EditProfileCubit(
          gh<_i11.EditProfileService>(),
          gh<_i36.UpdateProfileImgService>(),
        ));
    gh.factory<_i44.EventsCubit>(
        () => _i44.EventsCubit(gh<_i13.EventsService>()));
    gh.factory<_i45.ForumsCubit>(
        () => _i45.ForumsCubit(gh<_i16.ForumsService>()));
    gh.factory<_i46.GalleryCubit>(
        () => _i46.GalleryCubit(gh<_i18.GalleryService>()));
    gh.factory<_i47.HighlightsCubit>(
        () => _i47.HighlightsCubit(gh<_i21.HighlightsService>()));
    gh.factory<_i48.LogOutCubit>(() => _i48.LogOutCubit(
          gh<_i29.SignupService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i49.LoginWithEmailAndGoogleCubit>(
        () => _i49.LoginWithEmailAndGoogleCubit(
              gh<_i23.LoginService>(),
              gh<_i5.AuthTokenService>(),
              gh<_i29.SignupService>(),
            ));
    gh.factory<_i50.NoticesCubit>(
        () => _i50.NoticesCubit(gh<_i25.NoticesService>()));
    gh.factory<_i51.ProfileCubit>(
        () => _i51.ProfileCubit(gh<_i27.ProfileService>()));
    gh.factory<_i52.SplashScreenCubit>(() => _i52.SplashScreenCubit(
          gh<_i31.SplashScreenService>(),
          gh<_i5.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i53.FirebaseInjectableModule {}
