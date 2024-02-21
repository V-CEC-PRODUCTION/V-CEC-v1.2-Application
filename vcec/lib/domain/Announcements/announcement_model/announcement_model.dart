import 'dart:convert';

import 'announcement.dart';

class AnnouncementModel {
  List<Announcement>? announcements;
  int? totalPages;
  bool? hasNext;
  bool? hasPrevious;
  dynamic nextPageNumber;
  dynamic previousPageNumber;

  AnnouncementModel({
    this.announcements,
    this.totalPages,
    this.hasNext,
    this.hasPrevious,
    this.nextPageNumber,
    this.previousPageNumber,
  });

  @override
  String toString() {
    return 'AnnouncementModel(announcements: $announcements, totalPages: $totalPages, hasNext: $hasNext, hasPrevious: $hasPrevious, nextPageNumber: $nextPageNumber, previousPageNumber: $previousPageNumber)';
  }

  factory AnnouncementModel.fromMap(Map<String, dynamic> data) {
    return AnnouncementModel(
      announcements: (data['announcements'] as List<dynamic>?)
          ?.map((e) => Announcement.fromMap(e as Map<String, dynamic>))
          .toList(),
      totalPages: data['total_pages'] as int?,
      hasNext: data['has_next'] as bool?,
      hasPrevious: data['has_previous'] as bool?,
      nextPageNumber: data['next_page_number'] as dynamic,
      previousPageNumber: data['previous_page_number'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'announcements': announcements?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'has_next': hasNext,
        'has_previous': hasPrevious,
        'next_page_number': nextPageNumber,
        'previous_page_number': previousPageNumber,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnnouncementModel].
  factory AnnouncementModel.fromJson(String data) {
    return AnnouncementModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnnouncementModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AnnouncementModel copyWith({
    List<Announcement>? announcements,
    int? totalPages,
    bool? hasNext,
    bool? hasPrevious,
    dynamic nextPageNumber,
    dynamic previousPageNumber,
  }) {
    return AnnouncementModel(
      announcements: announcements ?? this.announcements,
      totalPages: totalPages ?? this.totalPages,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      nextPageNumber: nextPageNumber ?? this.nextPageNumber,
      previousPageNumber: previousPageNumber ?? this.previousPageNumber,
    );
  }
}
