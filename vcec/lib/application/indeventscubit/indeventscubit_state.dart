part of 'indeventscubit_cubit.dart';

@freezed
class IndEventsState with _$IndEventsState {
  const factory IndEventsState({
    required IndEventsModel? indEvents,
    required bool isLoading,
    required Option<Either<MainFailure, IndEventsModel>> isFailureOrSuccess,
    required Option<Either<MainFailure, bool>> isFailureOrSuccessForLike,
    required Option<Either<MainFailure, bool>> isFailureOrSuccessForRegister,
    required Option<Either<MainFailure, List<EventLike>>>
        isFailureOrSuccessForImgLikes,
    required List<EventLike> likes,
  }) = _IndEventsState;
  factory IndEventsState.initial() => IndEventsState(
        indEvents: null,
        isLoading: false,
        isFailureOrSuccess: none(),
        isFailureOrSuccessForLike: none(),
        isFailureOrSuccessForRegister: none(),
        isFailureOrSuccessForImgLikes: none(),
        likes: [],
      );
}
