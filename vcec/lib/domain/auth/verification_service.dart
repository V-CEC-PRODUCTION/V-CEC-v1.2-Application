import 'package:dartz/dartz.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class VerificationService {
  Future<Either<MainFailure, OtpModel>> postCode(String code);
}
