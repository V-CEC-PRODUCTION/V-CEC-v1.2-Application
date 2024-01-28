import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/events_service.dart';
import 'package:vcec/domain/events/model/event_types.dart';
import 'package:vcec/domain/events/model/events_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EventsService)
class EventsRepository extends EventsService {
  @override
  Future<Either<MainFailure, List<EventModel>>> getEvents(
      {required EventType eventType}) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}forum/events/get-event/?status=${eventType.name}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final events0 = WholeEventsModel.fromJson(response.data);
        final events = events0.events;
        return Right(events);
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
