class SeasonModel {
  List<SeasonResult>? seasonResult;

  SeasonModel({this.seasonResult});

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        seasonResult: (json['season_result'] as List<dynamic>?)
            ?.map((e) => SeasonResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}


class SeasonResult {
  int? season;

  SeasonResult({this.season});

  factory SeasonResult.fromJson(Map<String, dynamic> json) => SeasonResult(
        season: json['season'] as int?,
      );
}