import 'dart:convert';

class CarouselImage {
  int? id;
  String? imageUrl;
  String? thumbnailUrl;

  CarouselImage({this.id, this.imageUrl, this.thumbnailUrl});

  factory CarouselImage.fromMap(Map<String, dynamic> json) => CarouselImage(
        id: json['id'] as int?,
        imageUrl: json['image_url'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'image_url': imageUrl,
        'thumbnail_url': thumbnailUrl,
      };

  factory CarouselImage.fromJson(String data) {
    return CarouselImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String toJson() => json.encode(toMap());
  @override
  toString() {
    return 'CarouselImage(id: $id, thumbnail_url: $thumbnailUrl, image_url: $imageUrl)';
  }
}
