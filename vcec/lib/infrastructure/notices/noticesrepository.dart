import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/notices/notice_model/notice_model.dart';
import 'package:vcec/domain/notices/notice_model/notices_result.dart';
import 'package:vcec/domain/notices/notices_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: NoticesService)
class NoticesRepo extends NoticesService {
  @override
  Future<Either<MainFailure, List<NoticesResult>>> getnotices(
      {required NoticeType type}) async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final String source = type == NoticeType.cec ? 'cec' : 'ktu';
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}notices/nav/$source');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final notices0 = NoticeModel.fromJson(response.toString());
        final notices = notices0.noticesResult;

        return Right(notices!);
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
