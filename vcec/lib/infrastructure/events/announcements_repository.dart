import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/Announcements/announcement_model/annoucement.dart';
import 'package:vcec/domain/Announcements/announcement_model/announcement_model.dart';
import 'package:vcec/domain/Announcements/announcements_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: AnnouncementService)
class AnnouncementRepository extends AnnouncementService {
  @override
  Future<Either<MainFailure, List<Annoucement>>> getAnnouncements() async {
    try {
      print('forums');
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}forum/announcements/get-announcement/?forum=all');
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('hi');
        final announcements0 = AnnouncementModel.fromJson(response.toString());
        final announcements = announcements0.annoucements;
        print(announcements);
        return Right(announcements!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('forums');
      print(e.toString());
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
