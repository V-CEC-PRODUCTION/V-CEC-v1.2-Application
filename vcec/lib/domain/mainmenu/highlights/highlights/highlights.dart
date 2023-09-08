import 'dart:convert';

import 'highlight_info_image.dart';

class HighlightsModel {
  List<Highlight>? result;

  HighlightsModel({this.result});

  @override
  String toString() => 'HighlightsModel(result: $result)';

  factory HighlightsModel.fromMap(Map<String, dynamic> data) => HighlightsModel(
        result: (data['highlight_info_images'] as List<dynamic>?)
            ?.map((e) => Highlight.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'highlight_info_images': result?.map((e) => e.toMap()).toList(),
      };
  factory HighlightsModel.fromJson(String data) {
    return HighlightsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String toJson() => json.encode(toMap());
}
