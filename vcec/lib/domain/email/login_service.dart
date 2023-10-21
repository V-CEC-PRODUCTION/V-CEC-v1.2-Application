import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class LoginService {
  Future<Either<MainFailure, bool>> getAccess(String email,String password);
}
