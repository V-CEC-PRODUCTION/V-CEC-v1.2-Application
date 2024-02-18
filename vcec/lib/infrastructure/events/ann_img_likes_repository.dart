import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/announcements/ann_img_likes_service.dart';
import 'package:vcec/domain/events/model/likes_model/likes_model/event_like.dart';
import 'package:vcec/domain/events/model/likes_model/likes_model/likes_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: AnnImgLikesService)
class AnnImgLikesRepository extends AnnImgLikesService {
  @override
  Future<Either<MainFailure, List<EventLike>>> getLikes(
      {required int id}) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json')).get(
          '${baseUrl}forum/announcements/get/likes/announcement/ind?announcement_id=$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final likes0 = LikesModel.fromJson(response.toString());
        final likes = likes0.eventLikes;
        print(likes);
        return Right(likes!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(AuthFailure());
      } else if (e is DioException && e.response?.statusCode == 500 ||
          e is DioException && e.response?.statusCode == 501) {
        return const Left(MainFailure.serverFailure());
      } else {
        return const Left(MainFailure.clientFailure());
      }
    }
  }
}
