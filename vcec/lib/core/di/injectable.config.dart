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
    as _i43;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i46;
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart' as _i47;
import 'package:vcec/application/events/events_cubit.dart' as _i48;
import 'package:vcec/application/forums/forums_cubit.dart' as _i49;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i50;
import 'package:vcec/application/indannouncements/indannouncements_cubit.dart'
    as _i52;
import 'package:vcec/application/indeventscubit/indeventscubit_cubit.dart'
    as _i53;
import 'package:vcec/application/login/login_cubit.dart' as _i55;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i54;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i44;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i51;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i39;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i56;
import 'package:vcec/application/profile/profile_cubit.dart' as _i57;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i45;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i42;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i58;
import 'package:vcec/domain/Announcements/announcements_service.dart' as _i3;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i5;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i27;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i33;
import 'package:vcec/domain/departments/search/search_service.dart' as _i9;
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart'
    as _i23;
import 'package:vcec/domain/events/events_service.dart' as _i13;
import 'package:vcec/domain/events/forums/forums_service.dart' as _i16;
import 'package:vcec/domain/events/model/ind_events_service.dart' as _i25;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i18;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i7;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i21;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i37;
import 'package:vcec/domain/notices/notices_service.dart' as _i29;
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart'
    as _i11;
import 'package:vcec/domain/profile/profile_service/profile_service.dart'
    as _i31;
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart'
    as _i40;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i35;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i6;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i28;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i34;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i59;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i10;
import 'package:vcec/infrastructure/events/announcements_repository.dart'
    as _i4;
import 'package:vcec/infrastructure/events/events_repository.dart' as _i14;
import 'package:vcec/infrastructure/events/forums_repository.dart' as _i17;
import 'package:vcec/infrastructure/events/ind_announcements.dart' as _i24;
import 'package:vcec/infrastructure/events/ind_events_repository.dart' as _i26;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i19;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i8;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i22;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i38;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i30;
import 'package:vcec/infrastructure/profile/edit_profile_repo.dart' as _i12;
import 'package:vcec/infrastructure/profile/profile_repo.dart' as _i32;
import 'package:vcec/infrastructure/profile/update_profile_img_repo.dart'
    as _i41;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i36;

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
    gh.lazySingleton<_i23.IndAnnouncementsService>(
        () => _i24.AnnouncementsRepository());
    gh.lazySingleton<_i25.IndEventsService>(() => _i26.EventsRepository());
    gh.lazySingleton<_i27.LoginService>(() => _i28.LoginRepo());
    gh.lazySingleton<_i29.NoticesService>(() => _i30.NoticesRepo());
    gh.lazySingleton<_i31.ProfileService>(() => _i32.ProfileRepo());
    gh.lazySingleton<_i33.SignupService>(() => _i34.SignupRepo(
          gh<_i15.FirebaseAuth>(),
          gh<_i20.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i35.SplashScreenService>(() => _i36.SplashScreenRepo());
    gh.lazySingleton<_i37.TimeTableService>(() => _i38.TimeTableRespository());
    gh.factory<_i39.TimetableCubit>(
        () => _i39.TimetableCubit(gh<_i37.TimeTableService>()));
    gh.lazySingleton<_i40.UpdateProfileImgService>(
        () => _i41.UpdateProfileImgRepo());
    gh.factory<_i42.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i42.VerifyEmailAndSignUpWithGoogleCubit(gh<_i33.SignupService>()));
    gh.factory<_i43.AnnouncementCubit>(
        () => _i43.AnnouncementCubit(gh<_i3.AnnouncementService>()));
    gh.factory<_i44.CarouselCubit>(
        () => _i44.CarouselCubit(gh<_i7.CarouselService>()));
    gh.factory<_i45.CreateNewAccountCubit>(() => _i45.CreateNewAccountCubit(
          gh<_i33.SignupService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i46.DepartmentSearchCubit>(
        () => _i46.DepartmentSearchCubit(gh<_i9.DepartmentSearchService>()));
    gh.factory<_i47.EditProfileCubit>(() => _i47.EditProfileCubit(
          gh<_i11.EditProfileService>(),
          gh<_i40.UpdateProfileImgService>(),
        ));
    gh.factory<_i48.EventsCubit>(
        () => _i48.EventsCubit(gh<_i13.EventsService>()));
    gh.factory<_i49.ForumsCubit>(
        () => _i49.ForumsCubit(gh<_i16.ForumsService>()));
    gh.factory<_i50.GalleryCubit>(
        () => _i50.GalleryCubit(gh<_i18.GalleryService>()));
    gh.factory<_i51.HighlightsCubit>(
        () => _i51.HighlightsCubit(gh<_i21.HighlightsService>()));
    gh.factory<_i52.IndAnnouncementsCubit>(
        () => _i52.IndAnnouncementsCubit(gh<_i23.IndAnnouncementsService>()));
    gh.factory<_i53.IndEventsCubit>(
        () => _i53.IndEventsCubit(gh<_i25.IndEventsService>()));
    gh.factory<_i54.LogOutCubit>(() => _i54.LogOutCubit(
          gh<_i33.SignupService>(),
          gh<_i5.AuthTokenService>(),
        ));
    gh.factory<_i55.LoginWithEmailAndGoogleCubit>(
        () => _i55.LoginWithEmailAndGoogleCubit(
              gh<_i27.LoginService>(),
              gh<_i5.AuthTokenService>(),
              gh<_i33.SignupService>(),
            ));
    gh.factory<_i56.NoticesCubit>(
        () => _i56.NoticesCubit(gh<_i29.NoticesService>()));
    gh.factory<_i57.ProfileCubit>(
        () => _i57.ProfileCubit(gh<_i31.ProfileService>()));
    gh.factory<_i58.SplashScreenCubit>(() => _i58.SplashScreenCubit(
          gh<_i35.SplashScreenService>(),
          gh<_i5.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i59.FirebaseInjectableModule {}
