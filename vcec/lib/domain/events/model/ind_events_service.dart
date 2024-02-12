import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/ind_events_model/ind_events_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class IndEventsService {
  Future<Either<MainFailure, IndEventsModel>> getIndEvents({required int id});
}
