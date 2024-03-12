import 'package:dartz/dartz.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class EpisodesService {
  Future<Either<MainFailure, List<EpisodeResult>>> getFilterEpisodes(
      int season);
}
