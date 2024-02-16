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
  fetchEvents({required EventType eventType}) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await _eventsService.getEvents(eventType: eventType);
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
          EventType.Upcoming.name: r,
        },
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }
}
