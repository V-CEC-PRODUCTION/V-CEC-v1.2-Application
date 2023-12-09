import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/profile_model/profile_model.dart';

abstract class ProfileService {
  Future<Either<MainFailure, ProfileModel>> getProfileDetails();
}
