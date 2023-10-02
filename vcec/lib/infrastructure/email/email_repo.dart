

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/email/email_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

class EmailRepo extends EmailService{
  @override
  Future<Either<MainFailure, EmailModel>> getAccessToken(String email, String password) async{
      try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .post('${baseUrl}users/auth/sign-up/email/',data: {
            'email' : email,
            'password' : password
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final EmailModel accessToken =
            EmailModel.fromJson(response.toString());
        return Right(accessToken);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}