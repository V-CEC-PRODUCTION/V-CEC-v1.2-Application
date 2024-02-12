import 'dart:convert';

import 'announcement_result.dart';

class IndAnnouncementsModel {
  AnnouncementResult? announcementResult;
  int? totalLikes;

  IndAnnouncementsModel({this.announcementResult, this.totalLikes});

  @override
  String toString() {
    return 'IndAnnouncementsModel(announcementResult: $announcementResult, totalLikes: $totalLikes)';
  }

  factory IndAnnouncementsModel.fromMap(Map<String, dynamic> data) {
    return IndAnnouncementsModel(
      announcementResult: data['announcement_result'] == null
          ? null
          : AnnouncementResult.fromMap(
              data['announcement_result'] as Map<String, dynamic>),
      totalLikes: data['total_likes'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'announcement_result': announcementResult?.toMap(),
        'total_likes': totalLikes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndAnnouncementsModel].
  factory IndAnnouncementsModel.fromJson(String data) {
    return IndAnnouncementsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IndAnnouncementsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  IndAnnouncementsModel copyWith({
    AnnouncementResult? announcementResult,
    int? totalLikes,
  }) {
    return IndAnnouncementsModel(
      announcementResult: announcementResult ?? this.announcementResult,
      totalLikes: totalLikes ?? this.totalLikes,
    );
  }
}
