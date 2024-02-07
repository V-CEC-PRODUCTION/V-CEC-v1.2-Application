import 'dart:convert';

import 'annoucement.dart';

class AnnoucementModel {
  List<Annoucement>? annoucements;

  AnnoucementModel({this.annoucements});

  @override
  String toString() => 'AnnoucementModel(annoucements: $annoucements)';

  factory AnnoucementModel.fromMap(Map<String, dynamic> data) {
    return AnnoucementModel(
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
  /// Parses the string and returns the resulting Json object as [AnnoucementModel].
  factory AnnoucementModel.fromJson(String data) {
    return AnnoucementModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AnnoucementModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AnnoucementModel copyWith({
    List<Annoucement>? annoucements,
  }) {
    return AnnoucementModel(
      annoucements: annoucements ?? this.annoucements,
    );
  }
}
