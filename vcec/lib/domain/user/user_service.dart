import 'package:dartz/dartz.dart';

abstract class UserService {
  Future<Either<dynamic, bool>> getAccess();
  Future<String> getDeviceId();
}
