import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vcec/domain/mainmenu/carousel/carosel_model/carosel_model.dart';
import 'package:vcec/domain/mainmenu/carousel/carosel_model/result.dart';
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart';
//import 'package:vcec/domain/mainmenu/carousel/carousel_model/carousel_model.dart';
import 'package:dio/dio.dart';
//import 'package:vcec/domain/mainmenu/carousel/carousel_model/result.dart';

import '../../strings/strings.dart';

@LazySingleton(as: CarouselService)
class CarouselRepository extends CarouselService {
  @override
  Future<Either<MainFailure, List<CarouselImage>>> getCarouselImages() async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}homepage/images');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final CarouselModel carouselImages =
            CarouselModel.fromJson(response.toString());
        return Right(carouselImages.carouselImage!);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Client Errorrrr');
      return const Left(MainFailure.clientFailure());
    }
  }
}
