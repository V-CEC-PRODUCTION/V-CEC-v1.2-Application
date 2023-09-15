import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/auth/otp_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

import '../../strings/strings.dart';

@LazySingleton(as: OtpService)
class OtpRepository extends OtpService {
  @override
  Future<Either<MainFailure, OtpModel>> postEmail(String email) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .post('${baseUrl}users/auth/send-otp/', data: {
        'email': email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final OtpModel message = OtpModel.fromJson(response.toString());
        return Right(message);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Client Errorrrr');
      return const Left(MainFailure.clientFailure());
    }
  }
}
