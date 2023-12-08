import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AuthTokenService {
  Future<Either<MainFailure, bool>> validateToken();
  Future<Either<MainFailure, void>> getAccessToken();
  Future saveToken();
  Future deleteToken();
}
