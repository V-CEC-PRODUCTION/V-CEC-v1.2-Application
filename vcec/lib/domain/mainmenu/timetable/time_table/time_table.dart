import 'dart:convert';

import 'result.dart';

class TimeTableModel {
  List<TimeTable>? result;
  String? thumbnailUrl;
  String? imageThumbnailUrl;
  String? name;

  TimeTableModel(
      {this.result, this.thumbnailUrl, this.imageThumbnailUrl, this.name});

  @override
  String toString() {
    return 'TimeTableModel(result: $result, thumbnailUrl: $thumbnailUrl, imageThumbnailUrl: $imageThumbnailUrl. name: $name)';
  }

  factory TimeTableModel.fromMap(Map<String, dynamic> data) => TimeTableModel(
        result: (data['result'] as List<dynamic>?)
            ?.map((e) => TimeTable.fromMap(e as Map<String, dynamic>))
            .toList(),
        thumbnailUrl: data['thumbnail_url'] as String?,
        imageThumbnailUrl: data['image_thumbnail_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'result': result?.map((e) => e.toMap()).toList(),
        'thumbnail_url': thumbnailUrl,
        'image_thumbnail_url': imageThumbnailUrl,
        'name': 'TimeTableModel',
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TimeTableModel].
  factory TimeTableModel.fromJson(String data) {
    return TimeTableModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TimeTableModel] to a JSON string.
  String toJson() => json.encode(toMap());

  TimeTableModel copyWith({
    List<TimeTable>? result,
    String? thumbnailUrl,
    String? imageThumbnailUrl,
    String? name,
  }) {
    return TimeTableModel(
      result: result ?? this.result,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      imageThumbnailUrl: imageThumbnailUrl ?? this.imageThumbnailUrl,
      name: name ?? this.name,
    );
  }
}
