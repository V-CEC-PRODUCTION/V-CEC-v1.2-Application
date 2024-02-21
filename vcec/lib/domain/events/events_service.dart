import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/event_model/event_model.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EventsService {
  Future<Either<MainFailure, EventModel>> getEvents(
      {required EventType eventType,
      required String forum,
      required int pageNum,
      required bool call});
}
