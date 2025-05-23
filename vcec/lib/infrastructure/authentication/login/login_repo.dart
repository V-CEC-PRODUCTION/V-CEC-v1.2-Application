import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/authentication/login/login_service.dart';
import 'package:vcec/domain/authentication/token_model/token_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: LoginService)
class LoginRepo extends LoginService {
  @override
  Future<Either<MainFailure, void>> loginWithEmailAndPass(
      String email, String password) async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final Response response = await Dio(BaseOptions(headers:headers)).post(
        "${baseUrl}users/auth/login/api/token/email/",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final tokenModel = TokenModel.fromJson(response.data);
        AuthTokenManager.instance.setTokens(
            accessToken: tokenModel.accessToken!,
            refreshToken: tokenModel.refreshToken!);
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, void>> loginWithGoogle(String email) async {
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
        "${baseUrl}users/auth/login/api/token/google/",
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final tokenModel = TokenModel.fromJson(response.data);
        AuthTokenManager.instance.setTokens(
            accessToken: tokenModel.accessToken!,
            refreshToken: tokenModel.refreshToken!);
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, void>> updateDeviceID() async {
    String deviceId = await FirebaseMessaging.instance.getToken() ?? "";
    final manager = AuthTokenManager.instance;
    Object data = {
      "device_id": deviceId,
    };

    try {
      final response = await Dio(BaseOptions(
              headers: {"Authorization": "Bearer ${manager.accessToken}"}))
          .put("${baseUrl}users/auth/update/device-id/", data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 401) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
