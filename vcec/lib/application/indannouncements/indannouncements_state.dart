part of 'indannouncements_cubit.dart';

@freezed
class IndAnnouncementsState with _$IndAnnouncementsState {
  const factory IndAnnouncementsState({
    required IndAnnouncementsModel? indAnnouncements,
    required bool isLoading,
    required Option<Either<MainFailure, IndAnnouncementsModel>>
        isFailureOrSuccess,
    required Option<Either<MainFailure, bool>> isFailureOrSuccessForLike,
    required Option<Either<MainFailure, List<EventLike>>>
        isFailureOrSuccessForImgLikes,
    required List<EventLike> likes,
  }) = _IndEventsState;
  factory IndAnnouncementsState.initial() => IndAnnouncementsState(
      indAnnouncements: null,
      isLoading: false,
      isFailureOrSuccess: none(),
      isFailureOrSuccessForLike: none(),
      isFailureOrSuccessForImgLikes: none(),
      likes: []);
}
