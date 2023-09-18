import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class Authservice {
  Future<Either<MainFailure, User>> googleSignIn();
}
