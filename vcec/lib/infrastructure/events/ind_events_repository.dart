import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/model/ind_events_model/ind_events_model.dart';
import 'package:vcec/domain/events/model/ind_events_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: IndEventsService)
class EventsRepository extends IndEventsService {
  @override
  Future<Either<MainFailure, IndEventsModel>> getIndEvents(
      {required int id}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}forum/events/get-event/$id/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final events0 = IndEventsModel.fromJson(response.toString());
        final events = events0;
        return Right(events);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      
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
