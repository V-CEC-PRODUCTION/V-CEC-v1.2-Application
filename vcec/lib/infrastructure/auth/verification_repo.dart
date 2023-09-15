import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/auth/verification_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

import '../../strings/strings.dart';

@LazySingleton(as: VerificationService)
class VerificationRepository extends VerificationService {
  @override
  Future<Either<MainFailure, OtpModel>> postCode(String code) async {
    try {
      log(code);
      final response = await Dio(BaseOptions())
          .post('${baseUrl}users/auth/verify-otp/', data: {
           "user_otp": "896537",
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final OtpModel message = OtpModel.fromJson(response.toString());
        return Right(message);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      log('Client Errorrrr');
      return const Left(MainFailure.clientFailure());
    }
  }
}
