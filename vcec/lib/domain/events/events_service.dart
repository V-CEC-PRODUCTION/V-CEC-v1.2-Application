import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/events_models/event_types.dart';
import 'package:vcec/domain/events/model/events_models/events_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EventsService {
  Future<Either<MainFailure, List<EventModel>>> getEvents(
      {required EventType eventType});
}
