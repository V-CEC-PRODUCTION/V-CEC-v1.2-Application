import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/cecify/color/color_model.dart';
import 'package:vcec/domain/cecify/color/color_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: ColorService)
class ColorssRepo extends ColorService {
  @override
  Future<Either<MainFailure, List<ColorResult>>> getFilterColors() async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}forum/cecify/get/seasons');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final seasons = ColorModel.fromJson(response.data);
        final seasons0 = seasons.colorResult;
        log(response.data.toString());
        return Right(seasons0!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log("colors${e}");
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
