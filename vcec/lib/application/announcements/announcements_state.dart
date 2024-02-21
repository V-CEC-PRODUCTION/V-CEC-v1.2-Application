part of 'announcements_cubit.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState({
    required List<Announcement> announcements,
    required bool isLoading,
    required bool isFirstFetch,
    required bool hasNext,
    required Option<Either<MainFailure, List<Announcement>>> isFailureOrSuccess,
  }) = _AnnouncementState;
  factory AnnouncementState.initial() => AnnouncementState(
      announcements: [],
      isLoading: false,
      isFailureOrSuccess: none(),
      isFirstFetch: false,
      hasNext: true);
}
