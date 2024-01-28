import 'dart:convert';

class TimeTable {
  String? firstcode;
  String? secondcode;
  String? thirdcode;
  String? fourthcode;
  String? fifthcode;
  String? sixthcode;
  String? firsttime;
  String? secondtime;
  String? thirdtime;
  String? fourthtime;
  String? fifthtime;
  String? sixthtime;
  String? currentcode;
  String? currenttime;

  TimeTable({
    this.firstcode,
    this.secondcode,
    this.thirdcode,
    this.fourthcode,
    this.fifthcode,
    this.sixthcode,
    this.firsttime,
    this.secondtime,
    this.thirdtime,
    this.fourthtime,
    this.fifthtime,
    this.sixthtime,
    this.currentcode,
    this.currenttime,
  });

  @override
  String toString() {
    return 'TimeTable(firstcode: $firstcode, secondcode: $secondcode, thirdcode: $thirdcode, fourthcode: $fourthcode, fifthcode: $fifthcode, sixthcode: $sixthcode, firsttime: $firsttime, secondtime: $secondtime, thirdtime: $thirdtime, fourthtime: $fourthtime, fifthtime: $fifthtime, sixthtime: $sixthtime, currentcode: $currentcode, currenttime: $currenttime)';
  }

  factory TimeTable.fromMap(Map<String, dynamic> data) => TimeTable(
        firstcode: data['firstcode'] as String?,
        secondcode: data['secondcode'] as String?,
        thirdcode: data['thirdcode'] as String?,
        fourthcode: data['fourthcode'] as String?,
        fifthcode: data['fifthcode'] as String?,
        sixthcode: data['sixthcode'] as String?,
        firsttime: data['firsttime'] as String?,
        secondtime: data['secondtime'] as String?,
        thirdtime: data['thirdtime'] as String?,
        fourthtime: data['fourthtime'] as String?,
        fifthtime: data['fifthtime'] as String?,
        sixthtime: data['sixthtime'] as String?,
        currentcode: data['currentcode'] as String?,
        currenttime: data['currenttime'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'firstcode': firstcode,
        'secondcode': secondcode,
        'thirdcode': thirdcode,
        'fourthcode': fourthcode,
        'fifthcode': fifthcode,
        'sixthcode': sixthcode,
        'firsttime': firsttime,
        'secondtime': secondtime,
        'thirdtime': thirdtime,
        'fourthtime': fourthtime,
        'fifthtime': fifthtime,
        'sixthtime': sixthtime,
        'currentcode': currentcode,
        'currenttime': currenttime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TimeTable].
  factory TimeTable.fromJson(String data) {
    return TimeTable.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TimeTable] to a JSON string.
  String toJson() => json.encode(toMap());

  TimeTable copyWith({
    String? firstcode,
    String? secondcode,
    String? thirdcode,
    String? fourthcode,
    String? fifthcode,
    String? sixthcode,
    String? firsttime,
    String? secondtime,
    String? thirdtime,
    String? fourthtime,
    String? fifthtime,
    String? sixthtime,
    String? currentcode,
    String? currenttime,
  }) {
    return TimeTable(
      firstcode: firstcode ?? this.firstcode,
      secondcode: secondcode ?? this.secondcode,
      thirdcode: thirdcode ?? this.thirdcode,
      fourthcode: fourthcode ?? this.fourthcode,
      fifthcode: fifthcode ?? this.fifthcode,
      sixthcode: sixthcode ?? this.sixthcode,
      firsttime: firsttime ?? this.firsttime,
      secondtime: secondtime ?? this.secondtime,
      thirdtime: thirdtime ?? this.thirdtime,
      fourthtime: fourthtime ?? this.fourthtime,
      fifthtime: fifthtime ?? this.fifthtime,
      sixthtime: sixthtime ?? this.sixthtime,
      currentcode: currentcode ?? this.currentcode,
      currenttime: currenttime ?? this.currenttime,
    );
  }
}
