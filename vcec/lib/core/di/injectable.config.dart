// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart'
    as _i19;
import 'package:vcec/application/gallery/gallery_cubit.dart' as _i20;
import 'package:vcec/application/gallery/gallery_individual_cubit.dart' as _i21;
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart'
    as _i18;
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart'
    as _i22;
import 'package:vcec/application/main_menu/timetable/timetable_cubit.dart'
    as _i17;
import 'package:vcec/application/notices/notices_cubit_cubit.dart' as _i23;
import 'package:vcec/domain/departments/search/search_service.dart' as _i5;
import 'package:vcec/domain/gallery/gallery_pressed_service.dart' as _i7;
import 'package:vcec/domain/gallery/gallery_service.dart' as _i9;
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart' as _i3;
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart'
    as _i11;
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart' as _i15;
import 'package:vcec/domain/notices/notices_service.dart' as _i13;
import 'package:vcec/infrastructure/departments/department_search_repo.dart'
    as _i6;
import 'package:vcec/infrastructure/gallery/gallery_pressed_repository.dart'
    as _i8;
import 'package:vcec/infrastructure/gallery/gallery_repository.dart' as _i10;
import 'package:vcec/infrastructure/mainmenu/carousel_repo.dart' as _i4;
import 'package:vcec/infrastructure/mainmenu/highlights_repo.dart' as _i12;
import 'package:vcec/infrastructure/mainmenu/timetable_repo.dart' as _i16;
import 'package:vcec/infrastructure/notices/noticesrepository.dart' as _i14;

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
    gh.lazySingleton<_i3.CarouselService>(() => _i4.CarouselRepository());
    gh.lazySingleton<_i5.DepartmentSearchService>(
        () => _i6.DepartmentSearchRepo());
    gh.lazySingleton<_i7.GalleryPressedService>(() => _i8.GalleryRepository());
    gh.lazySingleton<_i9.GalleryService>(() => _i10.GalleryRepository());
    gh.lazySingleton<_i11.HighlightsService>(() => _i12.HighlightsRepo());
    gh.lazySingleton<_i13.NoticesService>(() => _i14.NoticesRepo());
    gh.lazySingleton<_i15.TimeTableService>(() => _i16.TimeTableRespository());
    gh.factory<_i17.TimetableCubit>(
        () => _i17.TimetableCubit(gh<_i15.TimeTableService>()));
    gh.factory<_i18.CarouselCubit>(
        () => _i18.CarouselCubit(gh<_i3.CarouselService>()));
    gh.factory<_i19.DepartmentSearchCubit>(
        () => _i19.DepartmentSearchCubit(gh<_i5.DepartmentSearchService>()));
    gh.factory<_i20.GalleryCubit>(
        () => _i20.GalleryCubit(gh<_i9.GalleryService>()));
    gh.factory<_i21.GalleryIndividualCubit>(
        () => _i21.GalleryIndividualCubit(gh<_i7.GalleryPressedService>()));
    gh.factory<_i22.HighlightsCubit>(
        () => _i22.HighlightsCubit(gh<_i11.HighlightsService>()));
    gh.factory<_i23.NoticesCubit>(
        () => _i23.NoticesCubit(gh<_i13.NoticesService>()));
    return this;
  }
}
