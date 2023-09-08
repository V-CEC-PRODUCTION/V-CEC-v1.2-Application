import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/gallery/gallery_pressed_model.dart';
import 'package:vcec/domain/gallery/gallery_pressed_service.dart';
part 'gallery_individual_cubit.freezed.dart';

part 'gallery_individual_state.dart';
@injectable
class GalleryIndividualCubit extends Cubit<GalleryIndividualState> {
  final GalleryPressedService _galleryPressedService;
  GalleryIndividualCubit(this._galleryPressedService) : super(GalleryIndividualState.initial());
  void getGalleryDetails(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    await _galleryPressedService.getGalleryDeatils(id).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            galleryIndividual: null,
            failureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            galleryIndividual: success,
            failureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
