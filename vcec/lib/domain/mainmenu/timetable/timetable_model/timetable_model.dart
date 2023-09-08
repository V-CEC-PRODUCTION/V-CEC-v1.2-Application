import 'dart:convert';

import 'time_table.dart';

class TimetableModel {
  String? current;
  dynamic currentCode;
  String? division;
  String? durationTime;
  String? nextUp;
  String? nextUpCode;
  String? semester;
  List<TimeTable>? timeTable;
  int? id;

  TimetableModel({
    this.current,
    this.currentCode,
    this.division,
    this.durationTime,
    this.nextUp,
    this.nextUpCode,
    this.semester,
    this.timeTable,
    this.id,
  });

  @override
  String toString() {
    return 'TimetableModel(current: $current, currentCode: $currentCode, division: $division, durationTime: $durationTime, nextUp: $nextUp, nextUpCode: $nextUpCode, semester: $semester, timeTable: $timeTable, id: $id)';
  }

  factory TimetableModel.fromMap(Map<String, dynamic> data) {
    return TimetableModel(
      current: data['Current'] as String?,
      currentCode: data['CurrentCode'] as dynamic,
      division: data['Division'] as String?,
      durationTime: data['Duration_Time'] as String?,
      nextUp: data['NextUp'] as String?,
      nextUpCode: data['NextUpCode'] as String?,
      semester: data['Semester'] as String?,
      timeTable: (data['Time_Table'] as List<dynamic>?)
          ?.map((e) => TimeTable.fromMap(e as Map<String, dynamic>))
          .toList(),
      id: data['id'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'Current': current,
        'CurrentCode': currentCode,
        'Division': division,
        'Duration_Time': durationTime,
        'NextUp': nextUp,
        'NextUpCode': nextUpCode,
        'Semester': semester,
        'Time_Table': timeTable?.map((e) => e.toMap()).toList(),
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TimetableModel].
  factory TimetableModel.fromJson(String data) {
    return TimetableModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TimetableModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
