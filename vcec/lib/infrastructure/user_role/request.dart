import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/failure/auth_failure.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/request_model.dart';
import 'package:vcec/domain/user/request_service.dart';

import '../../strings/strings.dart';

@LazySingleton(as: RequestService)
class RequestRepo implements RequestService {
  @override
  Future<Either<dynamic, RequestModel>> getRequest() async {
    try {
      final refreshToken = EmailModel.instance.refreshToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}users/auth/refresh/api/token/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        RequestModel token = RequestModel.fromJson(response.toString());
        EmailModel.instance.accessToken = token.accessToken;
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('access_token', token.accessToken!);
        return  Right(token);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(AuthFailure());
      } else {
        return const Left(MainFailure.clientFailure());
      }
    }
  }
}
