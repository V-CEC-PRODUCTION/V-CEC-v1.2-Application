import 'dart:convert';

class Highlight {
  int? id;
  String? content;
  String? imageUrl;
  String? thumbnailUrl;
  String? uploadTime;
  String? tag;

  Highlight({
    this.id,
    this.content,
    this.imageUrl,
    this.thumbnailUrl,
    this.uploadTime,
    this.tag,
  });

  @override
  String toString() {
    return 'Highlight(id: $id,content:$content imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, uploadTime: $uploadTime, tag:$tag)';
  }

  factory Highlight.fromMap(Map<String, dynamic> data) {
    return Highlight(
      id: data['id'] as int?,
      content: data['content'] as String?,
      imageUrl: data['image_url'] as String?,
      thumbnailUrl: data['thumbnail_url'] as String?,
      uploadTime: data['upload_time'] as String?,
      tag: data['tag'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'image_url': imageUrl,
        'thumbnail_url': thumbnailUrl,
        'upload_time': uploadTime,
        'tag': tag,
      };
  factory Highlight.fromJson(String data) {
    return Highlight.fromMap(json.decode(data) as Map<String, dynamic>);
  }
}
