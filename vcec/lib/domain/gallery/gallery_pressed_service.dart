import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/gallery/gallery_pressed_model.dart';

abstract class GalleryPressedService {
  Future<Either<MainFailure, GalleryPressedModel>> getGalleryDeatils(String id);
}
