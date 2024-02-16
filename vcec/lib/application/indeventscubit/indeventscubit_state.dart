part of 'indeventscubit_cubit.dart';

@freezed
class IndEventsState with _$IndEventsState {
  const factory IndEventsState({
    required IndEventsModel? indEvents,
    required bool isLoading,
    required Option<Either<MainFailure, IndEventsModel>> isFailureOrSuccess,
    required Option<Either<MainFailure, bool>> isFailureOrSuccessForLike,
  }) = _IndEventsState;
  factory IndEventsState.initial() => IndEventsState(
        indEvents: null,
        isLoading: false,
        isFailureOrSuccess: none(),
        isFailureOrSuccessForLike: none(),
      );
}
