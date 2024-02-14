import 'dart:convert';

class ConductedBy {
  String? imageUrl;

  ConductedBy({this.imageUrl});

  @override
  String toString() => 'ConductedBy(imageUrl: $imageUrl)';

  factory ConductedBy.fromMap(Map<String, dynamic> data) => ConductedBy(
        imageUrl: data['image_url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'image_url': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ConductedBy].
  factory ConductedBy.fromJson(String data) {
    return ConductedBy.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConductedBy] to a JSON string.
  String toJson() => json.encode(toMap());

  ConductedBy copyWith({
    String? imageUrl,
  }) {
    return ConductedBy(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
