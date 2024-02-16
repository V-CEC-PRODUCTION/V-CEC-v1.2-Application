import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class ForgotPasswordService {
  Future<Either<MainFailure, bool>> postPassword({required String email});
}
