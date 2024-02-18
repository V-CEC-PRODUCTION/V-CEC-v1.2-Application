import 'dart:convert';

import 'annoucement.dart';

class AnnouncementModel {
  List<Annoucement>? annoucements;

  AnnouncementModel({this.annoucements});

  @override
  String toString() => 'AnnouncementModel(annoucements: $annoucements)';

  factory AnnouncementModel.fromMap(Map<String, dynamic> data) {
    return AnnouncementModel(
      annoucements: (data['annoucements'] as List<dynamic>?)
          ?.map((e) => Annoucement.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'annoucements': annoucements?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AnnouncementModel].
  factory AnnouncementModel.fromJson(String data) {
    return AnnouncementModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnnouncementModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AnnouncementModel copyWith({
    List<Annoucement>? annoucements,
  }) {
    return AnnouncementModel(
      annoucements: annoucements ?? this.annoucements,
    );
  }
}
