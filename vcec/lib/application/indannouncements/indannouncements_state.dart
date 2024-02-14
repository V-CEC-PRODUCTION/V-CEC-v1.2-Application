part of 'indannouncements_cubit.dart';

@freezed
class IndAnnouncementsState with _$IndAnnouncementsState {
  const factory IndAnnouncementsState({
    required IndAnnouncementsModel? indAnnouncements,
    required bool isLoading,
    required Option<Either<MainFailure, IndAnnouncementsModel>>
        isFailureOrSuccess,
  }) = _IndEventsState;
  factory IndAnnouncementsState.initial() => IndAnnouncementsState(
        indAnnouncements: null,
        isLoading: false,
        isFailureOrSuccess: none(),
      );
}
