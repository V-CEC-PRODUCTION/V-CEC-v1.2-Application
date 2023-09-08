part of 'gallery_cubit.dart';
@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState(
      {required List<GalleryFile>? galleryfiles,
      required Option<Either<MainFailure, List<GalleryFile>>>
          failureOrSuccess}) = _GalleryState;
  factory GalleryState.initial() {
    return _GalleryState(galleryfiles: null,
     failureOrSuccess: none());
  }
}
