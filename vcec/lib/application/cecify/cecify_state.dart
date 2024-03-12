part of 'cecify_cubit.dart';

@freezed
class CecifyState with _$CecifyState {
  const factory CecifyState({
    required List<SeasonResult> seasons,
    required List<ColorResult> colors,
    required List<EpisodeResult> episodes,
    required bool isLoading,
    required bool isFirstFetch,
    required bool hasNext,
    required Option<Either<MainFailure, List<SeasonResult>>> isFailureOrSuccess,
    required Option<Either<MainFailure, List<ColorResult>>>
        isFailureOrSuccessForColors,
    required Option<Either<MainFailure, List<EpisodeResult>>>
        isFailureOrSuccessForEpisodes,
  }) = _CecifyState;
  factory CecifyState.initial() => CecifyState(
      seasons: [],
      colors: [],
      episodes: [],
      isLoading: false,
      isFailureOrSuccess: none(),
      isFailureOrSuccessForColors: none(),
      isFailureOrSuccessForEpisodes: none(),
      isFirstFetch: false,
      hasNext: true);
}
