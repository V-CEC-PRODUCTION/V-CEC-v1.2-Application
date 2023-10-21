import 'package:dartz/dartz.dart';
import 'package:vcec/domain/user/request_model.dart';
//import 'package:vcec/domain/failure/main_failure.dart';

abstract class RequestService {
  Future<Either<dynamic, RequestModel>> getRequest();
}
