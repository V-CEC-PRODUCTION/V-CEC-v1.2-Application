import 'dart:convert';

import 'result.dart';

class DepartmentModel {
  List<Staff>? staff;

  DepartmentModel({this.staff});

  @override
  String toString() => 'DepartmentModel(result: $staff)';

  factory DepartmentModel.fromMap(Map<String, dynamic> data) {
    return DepartmentModel(
      staff: (data['staff_search_result'] as List<dynamic>?)
          ?.map((e) => Staff.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'staff_search_result': staff?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DepartmentModel].
  factory DepartmentModel.fromJson(String data) {
    return DepartmentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DepartmentModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
