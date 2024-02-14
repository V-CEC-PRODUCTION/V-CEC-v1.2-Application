import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_model/ind_announcements_model.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: IndAnnouncementsService)
class AnnouncementsRepository extends IndAnnouncementsService {
  @override
  Future<Either<MainFailure, IndAnnouncementsModel>> getIndAnnouncements(
      {required int id}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      print(accessToken);
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}forum/announcements/get-announcement/$id/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final announcements0 =
            IndAnnouncementsModel.fromJson(response.toString());
        final announcements = announcements0;
        return Right(announcements);
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
