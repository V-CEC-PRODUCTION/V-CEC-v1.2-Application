part of 'carousel_cubit.dart';

@freezed
class CarouselState with _$CarouselState {
  const factory CarouselState({
    required List<CarouselImage>? carouselImages,
    required Option<Either<MainFailure, List<CarouselImage>>>
        carouselFailureOrSuccess,
  }) = _CarouselState;
  factory CarouselState.initial() {
    return _CarouselState(
      carouselImages: null,
      carouselFailureOrSuccess: none(),
    );
  }
}
