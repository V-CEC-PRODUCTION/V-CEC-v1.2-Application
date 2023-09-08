import 'dart:convert';

import 'highlight.dart';

class HighlightsModel {
  List<Highlight>? result;

  HighlightsModel({this.result});

  @override
  String toString() => 'HighlightsModel(result: $result)';

  factory HighlightsModel.fromMap(Map<String, dynamic> data) {
    return HighlightsModel(
      result: (data['highlights_result'] as List<dynamic>?)
          ?.map((e) => Highlight.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'highlights_result': result?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HighlightsModel].
  factory HighlightsModel.fromJson(String data) {
    return HighlightsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HighlightsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
