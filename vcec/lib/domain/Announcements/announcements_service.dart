import 'package:dartz/dartz.dart';
import 'package:vcec/domain/Announcements/annoucement_model/annoucement.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class AnnouncementService {
  Future<Either<MainFailure, List<Annoucement>>> getAnnouncements();
}
