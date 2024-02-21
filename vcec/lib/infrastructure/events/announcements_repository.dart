import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/Announcements/announcement_model/announcement_model.dart';
import 'package:vcec/domain/Announcements/announcements_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: AnnouncementService)
class AnnouncementRepository extends AnnouncementService {
  @override
  Future<Either<MainFailure, AnnouncementModel>> getAnnouncements(
      {required String forum, required int pageNum,required bool call}) async {
    int pageCount = 3;
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json')).get(
        call ?  '${baseUrl}forum/announcements/get-announcement/?forum=$forum&page=$pageNum&count=$pageCount' :  '${baseUrl}forum/announcements/get-announcement/?forum=$forum');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final announcements0 = AnnouncementModel.fromJson(response.toString());
        return Right(announcements0);
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
