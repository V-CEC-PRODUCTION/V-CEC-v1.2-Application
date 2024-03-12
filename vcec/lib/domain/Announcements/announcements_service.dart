import 'package:dartz/dartz.dart';
import 'package:vcec/domain/Announcements/announcement_model/announcement_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AnnouncementService {
  Future<Either<MainFailure, AnnouncementModel>> getAnnouncements(
      {required String forum, required int pageNum, required bool call});
}
