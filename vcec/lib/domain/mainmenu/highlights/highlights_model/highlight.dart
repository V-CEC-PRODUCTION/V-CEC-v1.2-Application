import 'dart:convert';

class Highlight {
  String? headline;
  int? id;
  String? imageUrl;
  String? imageUrlThumbnail;
  String? timeUpload;

  Highlight({
    this.headline,
    this.id,
    this.imageUrl,
    this.imageUrlThumbnail,
    this.timeUpload,
  });

  @override
  String toString() {
    return 'Highlight(headline: $headline, id: $id, imageUrl: $imageUrl, imageUrlThumbnail: $imageUrlThumbnail, timeUpload: $timeUpload)';
  }

  factory Highlight.fromMap(Map<String, dynamic> data) => Highlight(
        headline: data['headline'] as String?,
        id: data['id'] as int?,
        imageUrl: data['image_url'] as String?,
        imageUrlThumbnail: data['image_url_thumbnail'] as String?,
        timeUpload: data['time_upload'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'headline': headline,
        'id': id,
        'image_url': imageUrl,
        'image_url_thumbnail': imageUrlThumbnail,
        'time_upload': timeUpload,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the Highlighting Json object as [Highlight].
  factory Highlight.fromJson(String data) {
    return Highlight.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Highlight] to a JSON string.
  String toJson() => json.encode(toMap());
}
