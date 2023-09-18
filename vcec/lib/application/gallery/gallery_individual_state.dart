part of 'gallery_individual_cubit.dart';

@freezed
class GalleryIndividualState with _$GalleryIndividualState {
  const factory GalleryIndividualState(
      {required GalleryPressedModel? galleryIndividual,
      required Option<Either<MainFailure, GalleryPressedModel>>
          failureOrSuccess}) = _GalleryIndividualState;
  factory GalleryIndividualState.initial() {
    return _GalleryIndividualState(
      galleryIndividual: null,
      failureOrSuccess: none(),
    );
  }
}
