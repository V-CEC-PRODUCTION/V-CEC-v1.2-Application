import 'dart:convert';

class NoticeUrl {
  String? url;
  String? urlHead;

  NoticeUrl({this.url, this.urlHead});

  @override
  String toString() => 'NoticeUrl(url: $url, urlHead: $urlHead)';

  factory NoticeUrl.fromMap(Map<String, dynamic> data) => NoticeUrl(
        url: data['url'] as String?,
        urlHead: data['url_head'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'url_head': urlHead,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NoticeUrl].
  factory NoticeUrl.fromJson(String data) {
    return NoticeUrl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NoticeUrl] to a JSON string.
  String toJson() => json.encode(toMap());
}
