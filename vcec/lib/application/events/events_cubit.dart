import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/events_service.dart';
import 'package:vcec/domain/events/model/event_model/event.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'events_state.dart';
part 'events_cubit.freezed.dart';

@injectable
class EventsCubit extends Cubit<EventsState> {
  final EventsService _eventsService;
  EventsCubit(this._eventsService) : super(EventsState.initial());
  int pageNum = 1;
  fetchEvents({
    required EventType eventType,
    required String forum,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      isFirstFetch: pageNum == 1,
    ));
    final response = await _eventsService.getEvents(
        eventType: eventType, forum: forum, pageNum: pageNum, call: true);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
      List<Event> updatedEvents = List.from(state.events[eventType.name]!);
      updatedEvents.addAll(r.events!);
      emit(state.copyWith(
        isLoading: false,
        events: {
          EventType.Ended.name: state.events[EventType.Ended.name]!,
          EventType.Upcoming.name: updatedEvents,
        },
        isFailureOrSuccess: some(right(updatedEvents)),
       hasNext: r.hasNext!,
      ));

      pageNum++;
    });
  }

  fetchEvents1({
    required EventType eventType,
    required String forum,
  }) async {
    emit(state.copyWith(isLoading: true, events: {
      EventType.Ended.name: [],
      EventType.Upcoming.name: [],
    }));
    final response = await _eventsService.getEvents(
        eventType: eventType, forum: forum, pageNum: pageNum, call: false);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        events: {
          EventType.Ended.name: state.events[EventType.Ended.name]!,
          EventType.Upcoming.name: r.events!,
        },
        isFailureOrSuccess: some(right(r.events!)),
      ));
    });
  }
}
