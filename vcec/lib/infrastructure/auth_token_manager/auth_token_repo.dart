import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';
@LazySingleton(as: AuthTokenService)
class AuthTokenRepo extends AuthTokenService {
  @override
  Future deleteToken() async {
    final sharedPref = SharedPreferences.getInstance();
    sharedPref.then((value) {
      value.remove('access_token');
      value.remove('refresh_token');
    });
  }

  @override
  Future<Either<MainFailure, void>> getAccessToken() async {
    try {
      final refreshToken = AuthTokenManager.instance.refreshToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}users/auth/refresh/api/token/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        String accessToken = response.data['access_token'];
        AuthTokenManager.instance.setAccessToken(
          accessToken,
        );
        await deleteToken();
        await saveToken();
        return const Right(null);
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

  @override
  Future saveToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(
        'access_token', AuthTokenManager.instance.accessToken!);
    await sharedPref.setString(
        'refresh_token', AuthTokenManager.instance.refreshToken!);
    return;
  }

  @override
  Future<Either<MainFailure, bool>> validateToken() async {
    try {
      final accesToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accesToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}users/auth/validate/access/token/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
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
