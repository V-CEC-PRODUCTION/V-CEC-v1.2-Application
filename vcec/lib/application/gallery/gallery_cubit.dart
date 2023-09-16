import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
//import 'package:meta/meta.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/gallery/gallery_model/gallery_file.dart';
import 'package:vcec/domain/gallery/gallery_service.dart';
part 'gallery_cubit.freezed.dart';
part 'gallery_state.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  final GalleryService _galleryService;
  GalleryCubit(this._galleryService) : super(GalleryState.initial());
  void getGalleryImages() async {
    await Future.delayed(const Duration(seconds: 2));
    await _galleryService.getGalleryImages().then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            galleryfiles: null, failureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            galleryfiles: success, failureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
