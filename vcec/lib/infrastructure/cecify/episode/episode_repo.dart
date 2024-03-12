import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';
import 'package:vcec/domain/cecify/episodes/episodes_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EpisodesService)
class EpisodesRepo extends EpisodesService {
  @override
  Future<Either<MainFailure, List<EpisodeResult>>> getFilterEpisodes(
      int season) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .get(
              '${baseUrl}forum/cecify/get/season/episodes?season_number=$season');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final seasons = EpisodeModel.fromJson(response.data);
        final seasons0 = seasons.episodesResult;
        print(seasons0.toString());
        return Right(seasons0!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log("${e}episodes");
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
