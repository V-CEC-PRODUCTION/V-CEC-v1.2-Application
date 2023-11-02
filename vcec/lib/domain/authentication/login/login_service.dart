import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class LoginService {
  Future<Either<MainFailure, void>> loginWithEmailAndPass(
      String email, String password);
  Future<Either<MainFailure, void>> loginWithGoogle();
}
