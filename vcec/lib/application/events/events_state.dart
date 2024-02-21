part of 'events_cubit.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState({
    required Map<String, List<Event>> events,
    required bool isLoading,
    required bool isFirstFetch,
    required bool hasNext,
    required Option<Either<MainFailure, List<Event>>> isFailureOrSuccess,
  }) = _EventsState;
  factory EventsState.initial() => EventsState(
        events: {
          EventType.Ended.name: [],
          EventType.Upcoming.name: [],
        },
        isLoading: false,
        isFailureOrSuccess: none(),
        isFirstFetch: false,
        hasNext: true,
      );
}
