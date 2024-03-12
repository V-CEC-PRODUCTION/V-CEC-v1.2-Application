import 'package:dartz/dartz.dart';
import 'package:vcec/domain/cecify/filter_seasons/season_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class SeasonService {
  Future<Either<MainFailure, List<SeasonResult>>> getFilterSeasons();
}
