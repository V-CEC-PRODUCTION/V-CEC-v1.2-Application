import 'dart:convert';

class TimeTable {
  String? code;
  String? period;
  String? time;

  TimeTable({this.code, this.period, this.time});

  @override
  String toString() {
    return 'TimeTable(code: $code, period: $period, time: $time)';
  }

  factory TimeTable.fromMap(Map<String, dynamic> data) => TimeTable(
        code: data['Code'] as String?,
        period: data['Period'] as String?,
        time: data['Time'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Code': code,
        'Period': period,
        'Time': time,
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
}
