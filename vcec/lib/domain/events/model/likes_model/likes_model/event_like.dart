import 'dart:convert';

class EventLike {
  String? name;
  dynamic imageUrl;

  EventLike({this.name, this.imageUrl});

  @override
  String toString() => 'EventLike(name: $name, imageUrl: $imageUrl)';

  factory EventLike.fromMap(Map<String, dynamic> data) => EventLike(
        name: data['name'] as String?,
        imageUrl: data['image_url'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'image_url': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EventLike].
  factory EventLike.fromJson(String data) {
    return EventLike.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EventLike] to a JSON string.
  String toJson() => json.encode(toMap());

  EventLike copyWith({
    String? name,
    dynamic imageUrl,
  }) {
    return EventLike(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
