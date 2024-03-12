import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/cecify/filter_seasons/season_model.dart';
import 'package:vcec/domain/cecify/filter_seasons/season_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: SeasonService)
class SeasonsRepo extends SeasonService {
  @override
  Future<Either<MainFailure, List<SeasonResult>>> getFilterSeasons() async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get('${baseUrl}forum/cecify/filter/seasons');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final seasons = SeasonModel.fromJson(response.data);
        final seasons0 = seasons.seasonResult;
        print(seasons0.toString());
        return Right(seasons0!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log("${e}seasons");
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
