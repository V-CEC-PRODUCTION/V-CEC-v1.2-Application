import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
    print(email);
    print(password);
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
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
      print(e.toString() + "eeeee");
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
    print(email);
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
      print(e.toString());
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
}
