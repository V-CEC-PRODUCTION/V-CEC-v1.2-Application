import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/forums/forum_model/forum_role_name.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class ForumsService {
  Future<Either<MainFailure, List<AllForum>>> getForums();
}
