import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/role_model/user_role_model.dart';

abstract class RoleService {
  Future<Either<MainFailure, UserRoleModel>> getRole();
}
