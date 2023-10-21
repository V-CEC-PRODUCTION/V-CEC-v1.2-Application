import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class SignInGoogleService {
  Future<Either<MainFailure, bool>> getAccessToken(String email);
}
