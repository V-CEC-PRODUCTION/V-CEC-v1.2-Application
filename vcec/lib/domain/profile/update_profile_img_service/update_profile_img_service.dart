import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class UpdateProfileImgService {
  Future<Either<MainFailure, bool>> putProfileImg({required File imageFile});
}
