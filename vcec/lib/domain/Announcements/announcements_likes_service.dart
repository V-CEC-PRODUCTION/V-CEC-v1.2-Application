import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AnnouncementsLikesService {
  Future<Either<MainFailure, bool>> postLike({required int id, required String val});
}
