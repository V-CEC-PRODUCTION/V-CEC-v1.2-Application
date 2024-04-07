import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/gallery/gallery_model/gallery_file.dart';
import 'package:vcec/domain/gallery/gallery_model/gallery_model.dart';
import 'package:vcec/domain/gallery/gallery_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: GalleryService)
class GalleryRepository extends GalleryService {
  @override
  Future<Either<MainFailure, List<GalleryFile>>> getGalleryImages() async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}gallery/cec/images/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final GalleryModel galleryImages =
            GalleryModel.fromJson(response.toString());
        return Right(galleryImages.galleryFiles!);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}
