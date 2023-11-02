//import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/email/login_google_service.dart';
import 'package:vcec/domain/email/sign_in_google_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: LogInGoogleService)
class LoginInGoogleRepo extends LogInGoogleService {
  @override
  Future<Either<MainFailure, bool>> getAccess(String email) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .post('${baseUrl}users/auth/login/api/token/google/',
              data: {'email': email});
      if (response.statusCode == 200 || response.statusCode == 201) {
        // final AuthTokenManager accessToken = AuthTokenManager.fromJson(response.toString());
        // AuthTokenManager.instance.accessToken = accessToken.accessToken;
        // AuthTokenManager.instance.refreshToken = accessToken.refreshToken;
        //  final sharedPreferences = await SharedPreferences.getInstance();
        // await sharedPreferences.setString('access_token', accessToken.accessToken!);
        // await sharedPreferences.setString('refresh_token', accessToken.refreshToken!);
        // print(AuthTokenManager.instance.accessToken);
        // print(AuthTokenManager.instance.refreshToken);
        return const Right(true);
      } else {
        print('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}
