import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EditProfileService {
  Future<Either<MainFailure, bool>> putProfileDetails(
      {required String name,
      required String email,
      required String adno,
      required String sem,
      required String branch,
      required String regno,
      required String div,
      required String ieeeno});
}
