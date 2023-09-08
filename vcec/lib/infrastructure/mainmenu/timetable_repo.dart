//import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
//import 'package:vcec/domain/mainmenu/timetable/timetable_model/time_table.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_model/timetable_model.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: TimeTableService)
class TimeTableRespository implements TimeTableService {
  @override
  Future<Either<MainFailure, TimetableModel>> getTimetable() async {
    try {
      final response = await Dio(BaseOptions())
          .get('${baseUrl}timetable/current/get?semester=4&division=D');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final TimetableModel timetable =
            TimetableModel.fromJson(response.toString());
        return Right(timetable);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
