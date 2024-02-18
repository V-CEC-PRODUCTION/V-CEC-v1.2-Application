import 'dart:convert';

class NoticesResult {
  String? title;
  String? date;
  String? description;
  int? downloadCount;
  List<dynamic>? downloadUrl;
  List<dynamic>? downloadName;

  NoticesResult({
    this.title,
    this.date,
    this.description,
    this.downloadCount,
    this.downloadUrl,
    this.downloadName,
  });

  @override
  String toString() {
    return 'NoticesResult(title: $title, date: $date, description: $description, downloadCount: $downloadCount, downloadUrl: $downloadUrl, downloadName: $downloadName)';
  }

  factory NoticesResult.fromMap(Map<String, dynamic> data) => NoticesResult(
        title: data['title'] as String?,
        date: data['date'] as String?,
        description: data['description'] as String?,
        downloadCount: data['download_count'] as int?,
        downloadUrl: data['download_url'] as List<dynamic>?,
        downloadName: data['download_name'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'date': date,
        'description': description,
        'download_count': downloadCount,
        'download_url': downloadUrl,
        'download_name': downloadName,
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

  NoticesResult copyWith({
    String? title,
    String? date,
    String? description,
    int? downloadCount,
    List<dynamic>? downloadUrl,
    List<dynamic>? downloadName,
  }) {
    return NoticesResult(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      downloadCount: downloadCount ?? this.downloadCount,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      downloadName: downloadName ?? this.downloadName,
    );
  }
}
