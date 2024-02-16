import 'dart:convert';

import 'event_like.dart';

class LikesModel {
  List<EventLike>? eventLikes;

  LikesModel({this.eventLikes});

  @override
  String toString() => 'LikesModel(eventLikes: $eventLikes)';

  factory LikesModel.fromMap(Map<String, dynamic> data) => LikesModel(
        eventLikes: (data['event_likes'] as List<dynamic>?)
            ?.map((e) => EventLike.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'event_likes': eventLikes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LikesModel].
  factory LikesModel.fromJson(String data) {
    return LikesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LikesModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LikesModel copyWith({
    List<EventLike>? eventLikes,
  }) {
    return LikesModel(
      eventLikes: eventLikes ?? this.eventLikes,
    );
  }
}
