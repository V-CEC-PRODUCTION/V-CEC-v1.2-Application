import 'dart:convert';

class CarouselImage {
  String? filename;
  int? id;
  String? imageThumbnailUrl;
  String? imageUrl;
  String? url;

  CarouselImage({
    this.filename,
    this.id,
    this.imageThumbnailUrl,
    this.imageUrl,
    this.url,
  });

  factory CarouselImage.fromMap(Map<String, dynamic> data) => CarouselImage(
        filename: data['filename'] as String?,
        id: data['id'] as int?,
        imageThumbnailUrl: data['image_thumbnail_url'] as String?,
        imageUrl: data['image_url'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'filename': filename,
        'id': id,
        'image_thumbnail_url': imageThumbnailUrl,
        'image_url': imageUrl,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the CarouselImageing Json object as [CarouselImage].
  factory CarouselImage.fromJson(String data) {
    return CarouselImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CarouselImage] to a JSON string.
  String toJson() => json.encode(toMap());
  toString() {
    return 'CarouselImage(filename: $filename, id: $id, imageThumbnailUrl: $imageThumbnailUrl, imageUrl: $imageUrl, url: $url)';
  }
}
