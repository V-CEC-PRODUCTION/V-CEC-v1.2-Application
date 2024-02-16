import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/model/likes_model/likes_model/event_like.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class ImgLikesService {
  Future<Either<MainFailure, List<EventLike>>> getLikes({required int id});
}
