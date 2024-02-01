import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/time_table/time_table.dart';

abstract class TimeTableService {
  Future<Either<MainFailure, TimeTableModel>> getTimetable();
}
