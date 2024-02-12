import 'package:dartz/dartz.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_model/ind_announcements_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class IndAnnouncementsService {
  Future<Either<MainFailure, IndAnnouncementsModel>> getIndAnnouncements({required int id});
}
