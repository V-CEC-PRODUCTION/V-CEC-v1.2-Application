part of 'forums_cubit.dart';

@freezed
class ForumsState with _$ForumsState {
  const factory ForumsState({
    required List<AllForum> forums,
    required bool isLoading,
    required Option<Either<MainFailure, List<AllForum>>> isFailureOrSuccess,
  }) = _ForumsState;
  factory ForumsState.initial() => ForumsState(
        forums: [],
        isLoading: false,
        isFailureOrSuccess: none(),
      );
}
