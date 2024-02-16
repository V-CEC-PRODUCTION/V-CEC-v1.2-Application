import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/events_service.dart';
import 'package:vcec/domain/events/model/event_model/event.dart';
import 'package:vcec/domain/events/model/event_model/event_model.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EventsService)
class EventsRepository extends EventsService {
  @override
  Future<Either<MainFailure, List<Event>>> getEvents(
      {required EventType eventType}) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json')).get(
          '${baseUrl}forum/events/get-event/?status=${eventType.name}&forum=all');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final events0 = EventModel.fromJson(response.toString());
        final events = events0.events;
        print(events);
        return Right(events!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
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
