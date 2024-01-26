part of 'events_cubit.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    required Map<String, List<EventModel>> events,
    required bool isLoading,
    required Option<Either<MainFailure, List<EventModel>>> isFailureOrSuccess,
  }) = _EventsState;
  factory EventsState.initial() => EventsState(
        events: {
          EventType.Ended.name: [],
          EventType.Upcoming.name: [],
        },
        isLoading: false,
        isFailureOrSuccess: none(),
      );
}
