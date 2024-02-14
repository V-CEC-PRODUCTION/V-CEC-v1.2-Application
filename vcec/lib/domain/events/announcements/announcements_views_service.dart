import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AnnouncementsViewsService {
  Future<Either<MainFailure, bool>> postView({required int id});
}
