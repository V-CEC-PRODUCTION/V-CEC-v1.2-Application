import 'dart:convert';

import 'announcement_result.dart';
import 'conducted_by.dart';

class IndAnnouncementsModel {
  AnnouncementResult? announcementResult;
  int? totalLikes;
  List<ConductedBy>? conductedBy;
  bool? isLiked;

  IndAnnouncementsModel({
    this.announcementResult,
    this.totalLikes,
    this.conductedBy,
    this.isLiked,
  });

  @override
  String toString() {
    return 'IndAnnouncementsModel(announcementResult: $announcementResult, totalLikes: $totalLikes, conductedBy: $conductedBy, isLiked: $isLiked)';
  }

  factory IndAnnouncementsModel.fromMap(Map<String, dynamic> data) {
    return IndAnnouncementsModel(
      announcementResult: data['announcement_result'] == null
          ? null
          : AnnouncementResult.fromMap(
              data['announcement_result'] as Map<String, dynamic>),
      totalLikes: data['total_likes'] as int?,
      conductedBy: (data['conducted_by'] as List<dynamic>?)
          ?.map((e) => ConductedBy.fromMap(e as Map<String, dynamic>))
          .toList(),
      isLiked: data['is_liked'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'announcement_result': announcementResult?.toMap(),
        'total_likes': totalLikes,
        'conducted_by': conductedBy?.map((e) => e.toMap()).toList(),
        'is_liked': isLiked,
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
    List<ConductedBy>? conductedBy,
    bool? isLiked,
  }) {
    return IndAnnouncementsModel(
      announcementResult: announcementResult ?? this.announcementResult,
      totalLikes: totalLikes ?? this.totalLikes,
      conductedBy: conductedBy ?? this.conductedBy,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
