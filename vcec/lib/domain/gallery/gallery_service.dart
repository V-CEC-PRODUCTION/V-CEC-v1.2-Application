import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/gallery/gallery_model/gallery_file.dart';

abstract class GalleryService {
  Future<Either<MainFailure, List<GalleryFile>>> getGalleryImages();
}
