import 'package:dartz/dartz.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/events_service.dart';
import 'package:vcec/domain/events/model/event_model/event_model.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EventsService)
class EventsRepository extends EventsService {
  @override
  Future<Either<MainFailure, EventModel>> getEvents(
      {required EventType eventType,
      required String forum,
      required int pageNum,
      required bool call}) async {
    int pageCount = 4;
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final response = await Dio(BaseOptions(headers: headers)).get(call
          ? '${baseUrl}forum/events/get-event/?status=${eventType.name}&forum=$forum&page=$pageNum&count=$pageCount'
          : '${baseUrl}forum/events/get-event/?status=${eventType.name}&forum=$forum');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final events0 = EventModel.fromJson(response.toString());
        return Right(events0);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(AuthFailure());
      } else if (e is DioException && e.response?.statusCode == 500 ||
          e is DioException && e.response?.statusCode == 501) {
        return const Left(MainFailure.serverFailure());
      } else {
        return const Left(MainFailure.clientFailure());
      }
    }
  }
}
