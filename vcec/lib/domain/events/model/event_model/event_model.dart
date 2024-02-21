import 'dart:convert';

import 'event.dart';

class EventModel {
  List<Event>? events;
  bool? hasNext;
  bool? hasPrevious;
  int? nextPageNumber;
  int? previousPageNumber;

  EventModel(
      {this.events,
      this.hasNext,
      this.hasPrevious,
      this.nextPageNumber,
      this.previousPageNumber});

  @override
  String toString() =>
      'EventModel(events: $events, hasNext: $hasNext, hasPrevious: $hasPrevious, nextPageNumber: $nextPageNumber, previousPageNumber: $previousPageNumber)';

  factory EventModel.fromMap(Map<String, dynamic> data) => EventModel(
        events: (data['events'] as List<dynamic>?)
            ?.map((e) => Event.fromMap(e as Map<String, dynamic>))
            .toList(),
        hasNext: data['has_next'] as bool?,
        hasPrevious: data['has_previous'] as bool?,
        nextPageNumber: data['next_page_number'] as int?,
        previousPageNumber: data['previous_page_number'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'events': events?.map((e) => e.toMap()).toList(),
        'has_next': hasNext,
        'has_previous': hasPrevious,
        'next_page_number': nextPageNumber,
        'previous_page_number': previousPageNumber,
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
    bool? hasNext,
    bool? hasPrevious,
    int? nextPageNumber,
    int? previousPageNumber,
  }) {
    return EventModel(
      events: events ?? this.events,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      nextPageNumber: nextPageNumber ?? this.nextPageNumber,
      previousPageNumber: previousPageNumber ?? this.previousPageNumber,
    );
  }
}
