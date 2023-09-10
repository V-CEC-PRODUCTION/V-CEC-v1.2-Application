import 'dart:convert';

import 'notice_url.dart';

class NoticesResult {
  String? dateOfUpload;
  String? details;
  String? headline;
  List<NoticeUrl>? noticeUrls;
 

  NoticesResult({
    this.dateOfUpload,
    this.details,
    this.headline,
    this.noticeUrls,
   
  });

  @override
  String toString() {
    return 'NoticesResult(dateOfUpload: $dateOfUpload, details: $details, headline: $headline, noticeUrls: $noticeUrls,)';
  }

  factory NoticesResult.fromMap(Map<String, dynamic> data) => NoticesResult(
        dateOfUpload: data['date_of_upload'] as String?,
        details: data['details'] as String?,
        headline: data['headline'] as String?,
        noticeUrls: (data['notice_urls'] as List<dynamic>?)
            ?.map((e) => NoticeUrl.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'date_of_upload': dateOfUpload,
        'details': details,
        'headline': headline,
        'notice_urls': noticeUrls?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NoticesResult].
  factory NoticesResult.fromJson(String data) {
    return NoticesResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NoticesResult] to a JSON string.
  String toJson() => json.encode(toMap());
}
