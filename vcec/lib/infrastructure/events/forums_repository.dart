import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/forums/forum_model/forum_model.dart';
import 'package:vcec/domain/events/forums/forum_model/forum_role_name.dart';
import 'package:vcec/domain/events/forums/forums_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: ForumsService)
class ForumsRepository extends ForumsService {
  @override
  Future<Either<MainFailure, List<AllForum>>> getForums() async {
    try {
      
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}forum/management/get/roles/');
      if (response.statusCode == 200 || response.statusCode == 201) {
     
        final forums0 = ForumModel.fromJson(response.toString());
        final forums = forums0.forumRoleNames;
       
        return Right(forums!);
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
