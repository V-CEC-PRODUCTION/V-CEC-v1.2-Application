import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/authentication/forgot_password/forgot_password_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: ForgotPasswordService)
class ForgotPasswordRepository extends ForgotPasswordService {
  @override
  Future<Either<MainFailure, bool>> postPassword(
      {required String email}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers)).post(
          '${baseUrl}users/auth/forgot/password/',
          data: {"email": email});
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
