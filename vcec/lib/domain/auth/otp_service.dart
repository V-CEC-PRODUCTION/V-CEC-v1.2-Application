import 'package:dartz/dartz.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class OtpService {
  Future<Either<MainFailure, OtpModel>> postEmail(String email);
}
