import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/notices/notice_model/notices_result.dart';

abstract class NoticesService {
  Future<Either<MainFailure, List<NoticesResult>>> getnotices(
      {required NoticeType type});
}

enum NoticeType { cec, ktu }
