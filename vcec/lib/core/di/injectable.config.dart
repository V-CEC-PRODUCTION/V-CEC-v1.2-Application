// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i33;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/announcements/announcements_cubit.dart'
    as _i68;
import 'package:vcec/application/cecify/cecify_cubit.dart' as _i70;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i72;
import 'package:vcec/application/edit_profile/edit_profile_cubit.dart' as _i73;
import 'package:vcec/application/events/events_cubit.dart' as _i74;
import 'package:vcec/application/forgotpassword/forgotpassword_cubit.dart'
    as _i28;
import 'package:vcec/application/forums/forums_cubit.dart' as _i75;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i76;
import 'package:vcec/application/indannouncements/indannouncements_cubit.dart'
    as _i78;
import 'package:vcec/application/indeventscubit/indeventscubit_cubit.dart'
    as _i79;
import 'package:vcec/application/login/login_cubit.dart' as _i81;
import 'package:vcec/application/logout/log_out_cubit.dart' as _i80;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i69;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i77;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i62;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i82;
import 'package:vcec/application/profile/profile_cubit.dart' as _i83;
import 'package:vcec/application/signup/create_new_account/create_new_account_cubit.dart'
    as _i71;
import 'package:vcec/application/signup/verify_email/verify_email_cubit.dart'
    as _i65;
import 'package:vcec/application/splash_screen/splash_screen_cubit.dart'
    as _i84;
import 'package:vcec/domain/Announcements/announcements_likes_service.dart'
    as _i7;
import 'package:vcec/domain/Announcements/announcements_service.dart' as _i5;
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart' as _i11;
import 'package:vcec/domain/authentication/forgot_password/forgot_password_service.dart'
    as _i26;
import 'package:vcec/domain/authentication/login/login_service.dart' as _i44;
import 'package:vcec/domain/authentication/signup/signup_service.dart' as _i56;
import 'package:vcec/domain/cecify/color/color_service.dart' as _i15;
import 'package:vcec/domain/cecify/episodes/episodes_service.dart' as _i21;
import 'package:vcec/domain/cecify/filter_seasons/season_service.dart' as _i54;
import 'package:vcec/domain/departments/search/search_service.dart' as _i17;
import 'package:vcec/domain/events/announcements/ann_img_likes_service.dart'
    as _i3;
import 'package:vcec/domain/events/announcements/announcements_views_service.dart'
    as _i9;
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart'
    as _i38;
import 'package:vcec/domain/events/events_service.dart' as _i23;
import 'package:vcec/domain/events/forums/forums_service.dart' as _i29;
import 'package:vcec/domain/events/model/evenets_register_service.dart' as _i50;
import 'package:vcec/domain/events/model/events_views_service.dart' as _i66;
import 'package:vcec/domain/events/model/evnts_like_service.dart' as _i42;
import 'package:vcec/domain/events/model/ind_events_service.dart' as _i40;
import 'package:vcec/domain/events/model/likes_model/img_likes_service.dart'
    as _i36;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i31;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i13;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i34;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i60;
import 'package:vcec/domain/mainmenu/timetable/user_role_service.dart' as _i52;
import 'package:vcec/domain/notices/notices_service.dart' as _i46;
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart'
    as _i19;
import 'package:vcec/domain/profile/profile_service/profile_service.dart'
    as _i48;
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart'
    as _i63;
import 'package:vcec/domain/splash_screen/splash_screen_service.dart' as _i58;
import 'package:vcec/infrastructure/auth_token_manager/auth_token_repo.dart'
    as _i12;
import 'package:vcec/infrastructure/authentication/forgot_password/forgot_password_repo.dart'
    as _i27;
import 'package:vcec/infrastructure/authentication/login/login_repo.dart'
    as _i45;
import 'package:vcec/infrastructure/authentication/signup/signup_repo.dart'
    as _i57;
import 'package:vcec/infrastructure/cecify/color/color_repo.dart' as _i16;
import 'package:vcec/infrastructure/cecify/episode/episode_repo.dart' as _i22;
import 'package:vcec/infrastructure/cecify/filter_seasons/seasons_repo.dart'
    as _i55;
import 'package:vcec/infrastructure/core/firebase_injectable_module.dart'
    as _i85;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i18;
import 'package:vcec/infrastructure/events/ann_img_likes_repository.dart'
    as _i4;
import 'package:vcec/infrastructure/events/announcements_like_repository.dart'
    as _i8;
import 'package:vcec/infrastructure/events/announcements_repository.dart'
    as _i6;
import 'package:vcec/infrastructure/events/announcements_views_repository.dart'
    as _i10;
import 'package:vcec/infrastructure/events/events_like_repository.dart' as _i43;
import 'package:vcec/infrastructure/events/events_repository.dart' as _i24;
import 'package:vcec/infrastructure/events/events_views_repository.dart'
    as _i67;
import 'package:vcec/infrastructure/events/forums_repository.dart' as _i30;
import 'package:vcec/infrastructure/events/img_likes_repository.dart' as _i37;
import 'package:vcec/infrastructure/events/ind_announcements.dart' as _i39;
import 'package:vcec/infrastructure/events/ind_events_repository.dart' as _i41;
import 'package:vcec/infrastructure/events/register_events_repository.dart'
    as _i51;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i32;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i14;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i35;
import 'package:vcec/infrastructure/mainmenu/role_repo.dart' as _i53;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i61;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i47;
import 'package:vcec/infrastructure/profile/edit_profile_repo.dart' as _i20;
import 'package:vcec/infrastructure/profile/profile_repo.dart' as _i49;
import 'package:vcec/infrastructure/profile/update_profile_img_repo.dart'
    as _i64;
import 'package:vcec/infrastructure/splash_screen/splash_screen_repo.dart'
    as _i59;

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
    gh.lazySingleton<_i3.AnnImgLikesService>(() => _i4.AnnImgLikesRepository());
    gh.lazySingleton<_i5.AnnouncementService>(
        () => _i6.AnnouncementRepository());
    gh.lazySingleton<_i7.AnnouncementsLikesService>(
        () => _i8.AnnouncementsLikeRepository());
    gh.lazySingleton<_i9.AnnouncementsViewsService>(
        () => _i10.AnnouncementsViewsRepository());
    gh.lazySingleton<_i11.AuthTokenService>(() => _i12.AuthTokenRepo());
    gh.lazySingleton<_i13.CarouselService>(() => _i14.CarouselRepository());
    gh.lazySingleton<_i15.ColorService>(() => _i16.ColorssRepo());
    gh.lazySingleton<_i17.DepartmentSearchService>(
        () => _i18.DepartmentSearchRepo());
    gh.lazySingleton<_i19.EditProfileService>(() => _i20.EditProfileRepo());
    gh.lazySingleton<_i21.EpisodesService>(() => _i22.EpisodesRepo());
    gh.lazySingleton<_i23.EventsService>(() => _i24.EventsRepository());
    gh.lazySingleton<_i25.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i26.ForgotPasswordService>(
        () => _i27.ForgotPasswordRepository());
    gh.factory<_i28.ForgotpasswordCubit>(
        () => _i28.ForgotpasswordCubit(gh<_i26.ForgotPasswordService>()));
    gh.lazySingleton<_i29.ForumsService>(() => _i30.ForumsRepository());
    gh.lazySingleton<_i31.GalleryService>(() => _i32.GalleryRepository());
    gh.lazySingleton<_i33.GoogleSignIn>(
        () => firebaseInjectableModule.signInWithGoogle);
    gh.lazySingleton<_i34.HighlightsService>(() => _i35.HighlightsRepo());
    gh.lazySingleton<_i36.ImgLikesService>(() => _i37.ImgLikesRepository());
    gh.lazySingleton<_i38.IndAnnouncementsService>(
        () => _i39.AnnouncementsRepository());
    gh.lazySingleton<_i40.IndEventsService>(() => _i41.EventsRepository());
    gh.lazySingleton<_i42.LikesService>(() => _i43.LikesRepository());
    gh.lazySingleton<_i44.LoginService>(() => _i45.LoginRepo());
    gh.lazySingleton<_i46.NoticesService>(() => _i47.NoticesRepo());
    gh.lazySingleton<_i48.ProfileService>(() => _i49.ProfileRepo());
    gh.lazySingleton<_i50.RegisterService>(() => _i51.RegisterRepository());
    gh.lazySingleton<_i52.RoleService>(() => _i53.TimeTableRespository());
    gh.lazySingleton<_i54.SeasonService>(() => _i55.SeasonsRepo());
    gh.lazySingleton<_i56.SignupService>(() => _i57.SignupRepo(
          gh<_i25.FirebaseAuth>(),
          gh<_i33.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i58.SplashScreenService>(() => _i59.SplashScreenRepo());
    gh.lazySingleton<_i60.TimeTableService>(() => _i61.TimeTableRespository());
    gh.factory<_i62.TimetableCubit>(() => _i62.TimetableCubit(
          gh<_i60.TimeTableService>(),
          gh<_i52.RoleService>(),
        ));
    gh.lazySingleton<_i63.UpdateProfileImgService>(
        () => _i64.UpdateProfileImgRepo());
    gh.factory<_i65.VerifyEmailAndSignUpWithGoogleCubit>(() =>
        _i65.VerifyEmailAndSignUpWithGoogleCubit(gh<_i56.SignupService>()));
    gh.lazySingleton<_i66.ViewsService>(() => _i67.ViewsRepository());
    gh.factory<_i68.AnnouncementCubit>(
        () => _i68.AnnouncementCubit(gh<_i5.AnnouncementService>()));
    gh.factory<_i69.CarouselCubit>(
        () => _i69.CarouselCubit(gh<_i13.CarouselService>()));
    gh.factory<_i70.CecifyCubit>(() => _i70.CecifyCubit(
          gh<_i54.SeasonService>(),
          gh<_i15.ColorService>(),
          gh<_i21.EpisodesService>(),
        ));
    gh.factory<_i71.CreateNewAccountCubit>(() => _i71.CreateNewAccountCubit(
          gh<_i56.SignupService>(),
          gh<_i11.AuthTokenService>(),
        ));
    gh.factory<_i72.DepartmentSearchCubit>(
        () => _i72.DepartmentSearchCubit(gh<_i17.DepartmentSearchService>()));
    gh.factory<_i73.EditProfileCubit>(() => _i73.EditProfileCubit(
          gh<_i19.EditProfileService>(),
          gh<_i63.UpdateProfileImgService>(),
        ));
    gh.factory<_i74.EventsCubit>(
        () => _i74.EventsCubit(gh<_i23.EventsService>()));
    gh.factory<_i75.ForumsCubit>(
        () => _i75.ForumsCubit(gh<_i29.ForumsService>()));
    gh.factory<_i76.GalleryCubit>(
        () => _i76.GalleryCubit(gh<_i31.GalleryService>()));
    gh.factory<_i77.HighlightsCubit>(
        () => _i77.HighlightsCubit(gh<_i34.HighlightsService>()));
    gh.factory<_i78.IndAnnouncementsCubit>(() => _i78.IndAnnouncementsCubit(
          gh<_i38.IndAnnouncementsService>(),
          gh<_i9.AnnouncementsViewsService>(),
          gh<_i7.AnnouncementsLikesService>(),
          gh<_i3.AnnImgLikesService>(),
        ));
    gh.factory<_i79.IndEventsCubit>(() => _i79.IndEventsCubit(
          gh<_i40.IndEventsService>(),
          gh<_i66.ViewsService>(),
          gh<_i42.LikesService>(),
          gh<_i50.RegisterService>(),
          gh<_i36.ImgLikesService>(),
        ));
    gh.factory<_i80.LogOutCubit>(() => _i80.LogOutCubit(
          gh<_i56.SignupService>(),
          gh<_i11.AuthTokenService>(),
        ));
    gh.factory<_i81.LoginWithEmailAndGoogleCubit>(
        () => _i81.LoginWithEmailAndGoogleCubit(
              gh<_i44.LoginService>(),
              gh<_i11.AuthTokenService>(),
              gh<_i56.SignupService>(),
            ));
    gh.factory<_i82.NoticesCubit>(
        () => _i82.NoticesCubit(gh<_i46.NoticesService>()));
    gh.factory<_i83.ProfileCubit>(
        () => _i83.ProfileCubit(gh<_i48.ProfileService>()));
    gh.factory<_i84.SplashScreenCubit>(() => _i84.SplashScreenCubit(
          gh<_i58.SplashScreenService>(),
          gh<_i11.AuthTokenService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i85.FirebaseInjectableModule {}
