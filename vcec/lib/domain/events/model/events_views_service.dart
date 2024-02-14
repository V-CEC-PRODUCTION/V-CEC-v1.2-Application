import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class ViewsService {
  Future<Either<MainFailure, bool>> postView({required int id});
}
