part of 'cecify_cubit.dart';

@freezed
class CecifyState with _$CecifyState {
  const factory CecifyState({
    required List<SeasonResult> seasons,
    required List<ColorResult> colors,
    required List<EpisodeResult> episodes,
    required bool isLoading,
    required bool isFirstFetch,
    required int selectedSeason,
    required bool hasNext,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
  }) = _CecifyState;
  factory CecifyState.initial() => CecifyState(
      seasons: [],
      colors: [],
      episodes: [],
      isLoading: false,
      isFailureOrSuccess: none(),
      isFirstFetch: false,
      selectedSeason: 1,
      hasNext: true);
}
