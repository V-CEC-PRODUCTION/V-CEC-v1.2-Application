import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/failure/main_failure.dart';

abstract class ValidateService {
  Future<Either<dynamic, bool>> getValiadte();
}
