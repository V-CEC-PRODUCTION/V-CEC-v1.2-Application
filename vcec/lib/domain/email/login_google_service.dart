import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class LogInGoogleService {
  Future<Either<MainFailure, bool>> getAccess(String email);
}
