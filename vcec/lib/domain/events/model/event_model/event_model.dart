import 'dart:convert';

import 'event.dart';

class EventModel {
  List<Event>? events;

  EventModel({this.events});

  @override
  String toString() => 'EventModel(events: $events)';

  factory EventModel.fromMap(Map<String, dynamic> data) => EventModel(
        events: (data['events'] as List<dynamic>?)
            ?.map((e) => Event.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'events': events?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EventModel].
  factory EventModel.fromJson(String data) {
    return EventModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EventModel] to a JSON string.
  String toJson() => json.encode(toMap());

  EventModel copyWith({
    List<Event>? events,
  }) {
    return EventModel(
      events: events ?? this.events,
    );
  }
}
