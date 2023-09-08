import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/gallery/gallery_pressed_model.dart';
import 'package:vcec/domain/gallery/gallery_pressed_service.dart';
import 'package:vcec/strings/strings.dart';

import '../../domain/failure/main_failure.dart';

@LazySingleton(as: GalleryPressedService)
class GalleryRepository extends GalleryPressedService{ 
  @override
  Future<Either<MainFailure, GalleryPressedModel>> getGalleryDeatils(String id) async{
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}gallery/cec/files/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final GalleryPressedModel galleryIndividuals =
            GalleryPressedModel.fromJson(response.toString());
        return Right(galleryIndividuals);
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