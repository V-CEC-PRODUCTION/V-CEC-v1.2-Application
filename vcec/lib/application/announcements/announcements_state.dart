part of 'announcements_cubit.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState({
    required List<Annoucement> announcements,
    required bool isLoading,
    required Option<Either<MainFailure, List<Annoucement>>> isFailureOrSuccess,
  }) = _AnnouncementState;
  factory AnnouncementState.initial() => AnnouncementState(
        announcements: [],
        isLoading: false,
        isFailureOrSuccess: none(),
      );
}
