part of 'highlights_cubit.dart';

@freezed
class HighlightsState with _$HighlightsState {
  const factory HighlightsState({
    required HighlightsModel? highlights,
    required Option<Either<MainFailure, HighlightsModel>>
        highlightsSuccessOrFailure,
  }) = _Initial;
  factory HighlightsState.initial() => const HighlightsState(
        highlightsSuccessOrFailure: None(),
        highlights: null,
      );
}
