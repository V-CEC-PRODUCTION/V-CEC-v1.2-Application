import 'dart:convert';

import 'eveent_result.dart';

class IndEventsModel {
  EveentResult? eveentResult;
  int? totalLikes;

  IndEventsModel({this.eveentResult, this.totalLikes});

  @override
  String toString() {
    return 'IndEventsModel(eveentResult: $eveentResult, totalLikes: $totalLikes)';
  }

  factory IndEventsModel.fromMap(Map<String, dynamic> data) {
    return IndEventsModel(
      eveentResult: data['eveent_result'] == null
          ? null
          : EveentResult.fromMap(data['eveent_result'] as Map<String, dynamic>),
      totalLikes: data['total_likes'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'eveent_result': eveentResult?.toMap(),
        'total_likes': totalLikes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndEventsModel].
  factory IndEventsModel.fromJson(String data) {
    return IndEventsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IndEventsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  IndEventsModel copyWith({
    EveentResult? eveentResult,
    int? totalLikes,
  }) {
    return IndEventsModel(
      eveentResult: eveentResult ?? this.eveentResult,
      totalLikes: totalLikes ?? this.totalLikes,
    );
  }
}
