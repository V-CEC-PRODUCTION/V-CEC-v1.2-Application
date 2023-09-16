import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class Authservice {
  Future<Either<MainFailure, Unit>> googleSignIn();
}
