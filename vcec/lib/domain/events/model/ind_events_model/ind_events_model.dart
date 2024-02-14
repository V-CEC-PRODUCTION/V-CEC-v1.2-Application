import 'dart:convert';

import 'conducted_by.dart';
import 'event_result.dart';

class IndEventsModel {
  EventResult? eventResult;
  int? totalLikes;
  List<ConductedBy>? conductedBy;
  bool? isLiked;

  IndEventsModel({
    this.eventResult,
    this.totalLikes,
    this.conductedBy,
    this.isLiked,
  });

  @override
  String toString() {
    return 'IndEventsModel(eventResult: $eventResult, totalLikes: $totalLikes, conductedBy: $conductedBy, isLiked: $isLiked)';
  }

  factory IndEventsModel.fromMap(Map<String, dynamic> data) {
    return IndEventsModel(
      eventResult: data['event_result'] == null
          ? null
          : EventResult.fromMap(data['event_result'] as Map<String, dynamic>),
      totalLikes: data['total_likes'] as int?,
      conductedBy: (data['conducted_by'] as List<dynamic>?)
          ?.map((e) => ConductedBy.fromMap(e as Map<String, dynamic>))
          .toList(),
      isLiked: data['is_liked'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'event_result': eventResult?.toMap(),
        'total_likes': totalLikes,
        'conducted_by': conductedBy?.map((e) => e.toMap()).toList(),
        'is_liked': isLiked,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndEventsModel].
  factory IndEventsModel.fromJson(String data) {
    return IndEventsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IndEventsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  IndEventsModel copyWith({
    EventResult? eventResult,
    int? totalLikes,
    List<ConductedBy>? conductedBy,
    bool? isLiked,
  }) {
    return IndEventsModel(
      eventResult: eventResult ?? this.eventResult,
      totalLikes: totalLikes ?? this.totalLikes,
      conductedBy: conductedBy ?? this.conductedBy,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
