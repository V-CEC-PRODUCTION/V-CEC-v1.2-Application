import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_model/timetable_model.dart';

abstract class TimeTableService {
  Future<Either<MainFailure, TimetableModel>> getTimetable();
}
