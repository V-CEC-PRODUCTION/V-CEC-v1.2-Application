import 'dart:convert';

class GalleryFile {
  int? id;
  String? mediaUrl;
  String? thumbnailUrl;
  String? tag;
  DateTime? uploadTime;

  GalleryFile({
    this.id,
    this.mediaUrl,
    this.thumbnailUrl,
    this.tag,
    this.uploadTime,
  });

  @override
  String toString() {
    return 'GalleryFile(id: $id, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, tag: $tag, uploadTime: $uploadTime)';
  }

  factory GalleryFile.fromMap(Map<String, dynamic> data) => GalleryFile(
        id: data['id'] as int?,
        mediaUrl: data['media_url'] as String?,
        thumbnailUrl: data['thumbnail_url'] as String?,
        tag: data['tag'] as String?,
        uploadTime: data['upload_time'] == null
            ? null
            : DateTime.parse(data['upload_time'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'media_url': mediaUrl,
        'thumbnail_url': thumbnailUrl,
        'tag': tag,
        'upload_time': uploadTime?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GalleryFile].
  factory GalleryFile.fromJson(String data) {
    return GalleryFile.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GalleryFile] to a JSON string.
  String toJson() => json.encode(toMap());
}
