import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AddUserService {
  Future<Either<MainFailure, bool>> accountDeatils(String name,String? branch,String? sem,String? batch
  ,String? adno,String? gender,String deviceid);
}
