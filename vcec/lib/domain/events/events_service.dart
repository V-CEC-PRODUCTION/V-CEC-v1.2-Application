import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/event_model/event.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EventsService {
  Future<Either<MainFailure, List<Event>>> getEvents(
      {required EventType eventType});
}
