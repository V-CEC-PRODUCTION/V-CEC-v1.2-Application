import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/event_types.dart';
import 'package:vcec/domain/events/model/events_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EventsService {
  Future<Either<MainFailure, List<EventModel>>> getEvents(
      {required EventType eventType});
}
