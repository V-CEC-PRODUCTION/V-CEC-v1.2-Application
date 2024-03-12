class ColorModel {
  final List<ColorResult>? colorResult;

  ColorModel({required this.colorResult});
   factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        colorResult: (json['season_result'] as List<dynamic>?)
            ?.map((e) => ColorResult.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class ColorResult {
  int? id;
  int? season;
  String? color1;
  String? color2;
  String? color3;
  String? color4;

  ColorResult(
      {required this.id,
      required this.season,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4});

  factory ColorResult.fromJson(Map<String, dynamic> json) {
    return ColorResult(
      id: json['id'] ?? 0,
      season: json['season'] ?? 0,
      color1: json['color1'] ?? '',
      color2: json['color2'] ?? '',
      color3: json['color3'] ?? '',
      color4: json['color4'] ?? '',
    );
  }
}
