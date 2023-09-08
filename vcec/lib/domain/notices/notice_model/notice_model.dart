import 'dart:convert';

import 'notices_result.dart';

class NoticeModel {
  List<NoticesResult>? noticesResult;

  NoticeModel({this.noticesResult});

  @override
  String toString() => 'NoticeModel(noticesResult: $noticesResult)';

  factory NoticeModel.fromMap(Map<String, dynamic> data) => NoticeModel(
        noticesResult: (data['notices_result'] as List<dynamic>?)
            ?.map((e) => NoticesResult.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'notices_result': noticesResult?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NoticeModel].
  factory NoticeModel.fromJson(String data) {
    return NoticeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NoticeModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
