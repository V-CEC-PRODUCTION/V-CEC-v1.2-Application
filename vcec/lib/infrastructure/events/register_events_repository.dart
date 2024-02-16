import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/model/evenets_register_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: RegisterService)
class RegisterRepository extends RegisterService {
  @override
  Future<Either<MainFailure, bool>> postRegister({required int id}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}forum/events/student/register/?event_id=$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
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
