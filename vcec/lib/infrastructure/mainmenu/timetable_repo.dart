//import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
//import 'package:vcec/domain/mainmenu/timetable/timetable_model/time_table.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vcec/domain/mainmenu/timetable/time_table/time_table.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: TimeTableService)
class TimeTableRespository implements TimeTableService {
  @override
  Future<Either<MainFailure, TimeTableModel>> getTimetable() async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(
        headers: headers,
      )).get('${baseUrl}timetable/cec/get-timetable/current/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final TimeTableModel timetable =
            TimeTableModel.fromJson(response.toString());
          AuthTokenManager.instance.setDetails(
            imageUrl: timetable.imageThumbnailUrl!,
            name: timetable.name!,
            thumbnailUrl: timetable.thumbnailUrl!);
        return Right(timetable);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      return const Left(MainFailure.clientFailure());
    }
  }
}
