// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i27;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/announcements/announcements_cubit.dart'
    as _i54;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i57;
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart' as _i58;
import 'package:vcec/application/events/events_cubit.dart' as _i59;
import 'package:vcec/application/forgotpassword/forgotpassword_cubit.dart'
    as _i22;
import 'package:vcec/application/forums/forums_cubit.dart' as _i60;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i61;
import 'package:vcec/application/indannouncements/indannouncements_cubit.dart'
    as _i63;
import 'package:vcec/application/indeventscubit/indeventscubit_cubit.dart'
    as _i64;
import 'package:vcec/application/login/login_cubit.dart' as _i66;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i65;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i55;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i62;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i48;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i67;
import 'package:vcec/application/profile/profile_cubit.dart' as _i68;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i56;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i51;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i69;
import 'package:vcec/domain/Announcements/announcements_likes_service.dart'
    as _i5;
import 'package:vcec/domain/Announcements/announcements_service.dart' as _i3;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i9;
import 'package:vcec/domain/authentication/forgot_password/forgot_password_service.dart'
    as _i20;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i36;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i42;
import 'package:vcec/domain/departments/search/search_service.dart' as _i13;
import 'package:vcec/domain/events/announcements/announcements_views_service.dart'
    as _i7;
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart'
    as _i30;
import 'package:vcec/domain/events/events_service.dart' as _i17;
import 'package:vcec/domain/events/forums/forums_service.dart' as _i23;
import 'package:vcec/domain/events/model/events_views_service.dart' as _i52;
import 'package:vcec/domain/events/model/evnts_like_service.dart' as _i34;
import 'package:vcec/domain/events/model/ind_events_service.dart' as _i32;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i25;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i11;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i28;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i46;
import 'package:vcec/domain/notices/notices_service.dart' as _i38;
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart'
    as _i15;
import 'package:vcec/domain/profile/profile_service/profile_service.dart'
    as _i40;
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart'
    as _i49;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i44;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i10;
import 'package:vcec/infrastructure/authentication/forgot_password/forgot_password_repo.dart'
    as _i21;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i37;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i43;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i70;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i14;
import 'package:vcec/infrastructure/events/announcements_like_repository.dart'
    as _i6;
import 'package:vcec/infrastructure/events/announcements_repository.dart'
    as _i4;
import 'package:vcec/infrastructure/events/announcements_views_repository.dart'
    as _i8;
import 'package:vcec/infrastructure/events/events_like_repository.dart' as _i35;
import 'package:vcec/infrastructure/events/events_repository.dart' as _i18;
import 'package:vcec/infrastructure/events/events_views_repository.dart'
    as _i53;
import 'package:vcec/infrastructure/events/forums_repository.dart' as _i24;
import 'package:vcec/infrastructure/events/ind_announcements.dart' as _i31;
import 'package:vcec/infrastructure/events/ind_events_repository.dart' as _i33;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i26;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i12;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i29;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i47;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i39;
import 'package:vcec/infrastructure/profile/edit_profile_repo.dart' as _i16;
import 'package:vcec/infrastructure/profile/profile_repo.dart' as _i41;
import 'package:vcec/infrastructure/profile/update_profile_img_repo.dart'
    as _i50;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i45;

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
    gh.lazySingleton<_i5.AnnouncementsLikesService>(
        () => _i6.AnnouncementsLikeRepository());
    gh.lazySingleton<_i7.AnnouncementsViewsService>(
        () => _i8.AnnouncementsViewsRepository());
    gh.lazySingleton<_i9.AuthTokenService>(() => _i10.AuthTokenRepo());
    gh.lazySingleton<_i11.CarouselService>(() => _i12.CarouselRepository());
    gh.lazySingleton<_i13.DepartmentSearchService>(
        () => _i14.DepartmentSearchRepo());
    gh.lazySingleton<_i15.EditProfileService>(() => _i16.EditProfileRepo());
    gh.lazySingleton<_i17.EventsService>(() => _i18.EventsRepository());
    gh.lazySingleton<_i19.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i20.ForgotPasswordService>(
        () => _i21.ForgotPasswordRepository());
    gh.factory<_i22.ForgotpasswordCubit>(
        () => _i22.ForgotpasswordCubit(gh<_i20.ForgotPasswordService>()));
    gh.lazySingleton<_i23.ForumsService>(() => _i24.ForumsRepository());
    gh.lazySingleton<_i25.GalleryService>(() => _i26.GalleryRepository());
    gh.lazySingleton<_i27.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i28.HighlightsService>(() => _i29.HighlightsRepo());
    gh.lazySingleton<_i30.IndAnnouncementsService>(
        () => _i31.AnnouncementsRepository());
    gh.lazySingleton<_i32.IndEventsService>(() => _i33.EventsRepository());
    gh.lazySingleton<_i34.LikesService>(() => _i35.LikesRepository());
    gh.lazySingleton<_i36.LoginService>(() => _i37.LoginRepo());
    gh.lazySingleton<_i38.NoticesService>(() => _i39.NoticesRepo());
    gh.lazySingleton<_i40.ProfileService>(() => _i41.ProfileRepo());
    gh.lazySingleton<_i42.SignupService>(() => _i43.SignupRepo(
          gh<_i19.FirebaseAuth>(),
          gh<_i27.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i44.SplashScreenService>(() => _i45.SplashScreenRepo());
    gh.lazySingleton<_i46.TimeTableService>(() => _i47.TimeTableRespository());
    gh.factory<_i48.TimetableCubit>(
        () => _i48.TimetableCubit(gh<_i46.TimeTableService>()));
    gh.lazySingleton<_i49.UpdateProfileImgService>(
        () => _i50.UpdateProfileImgRepo());
    gh.factory<_i51.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i51.VerifyEmailAndSignUpWithGoogleCubit(gh<_i42.SignupService>()));
    gh.lazySingleton<_i52.ViewsService>(() => _i53.ViewsRepository());
    gh.factory<_i54.AnnouncementCubit>(
        () => _i54.AnnouncementCubit(gh<_i3.AnnouncementService>()));
    gh.factory<_i55.CarouselCubit>(
        () => _i55.CarouselCubit(gh<_i11.CarouselService>()));
    gh.factory<_i56.CreateNewAccountCubit>(() => _i56.CreateNewAccountCubit(
          gh<_i42.SignupService>(),
          gh<_i9.AuthTokenService>(),
        ));
    gh.factory<_i57.DepartmentSearchCubit>(
        () => _i57.DepartmentSearchCubit(gh<_i13.DepartmentSearchService>()));
    gh.factory<_i58.EditProfileCubit>(() => _i58.EditProfileCubit(
          gh<_i15.EditProfileService>(),
          gh<_i49.UpdateProfileImgService>(),
        ));
    gh.factory<_i59.EventsCubit>(
        () => _i59.EventsCubit(gh<_i17.EventsService>()));
    gh.factory<_i60.ForumsCubit>(
        () => _i60.ForumsCubit(gh<_i23.ForumsService>()));
    gh.factory<_i61.GalleryCubit>(
        () => _i61.GalleryCubit(gh<_i25.GalleryService>()));
    gh.factory<_i62.HighlightsCubit>(
        () => _i62.HighlightsCubit(gh<_i28.HighlightsService>()));
    gh.factory<_i63.IndAnnouncementsCubit>(() => _i63.IndAnnouncementsCubit(
          gh<_i30.IndAnnouncementsService>(),
          gh<_i7.AnnouncementsViewsService>(),
          gh<_i5.AnnouncementsLikesService>(),
        ));
    gh.factory<_i64.IndEventsCubit>(() => _i64.IndEventsCubit(
          gh<_i32.IndEventsService>(),
          gh<_i52.ViewsService>(),
          gh<_i34.LikesService>(),
        ));
    gh.factory<_i65.LogOutCubit>(() => _i65.LogOutCubit(
          gh<_i42.SignupService>(),
          gh<_i9.AuthTokenService>(),
        ));
    gh.factory<_i66.LoginWithEmailAndGoogleCubit>(
        () => _i66.LoginWithEmailAndGoogleCubit(
              gh<_i36.LoginService>(),
              gh<_i9.AuthTokenService>(),
              gh<_i42.SignupService>(),
            ));
    gh.factory<_i67.NoticesCubit>(
        () => _i67.NoticesCubit(gh<_i38.NoticesService>()));
    gh.factory<_i68.ProfileCubit>(
        () => _i68.ProfileCubit(gh<_i40.ProfileService>()));
    gh.factory<_i69.SplashScreenCubit>(() => _i69.SplashScreenCubit(
          gh<_i44.SplashScreenService>(),
          gh<_i9.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i70.FirebaseInjectableModule {}
