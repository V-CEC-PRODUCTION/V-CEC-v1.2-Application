import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class RegisterService {
  Future<Either<MainFailure, bool>> postRegister({required int id});
}
