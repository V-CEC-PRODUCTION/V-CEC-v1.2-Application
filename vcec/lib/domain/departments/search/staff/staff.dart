import 'dart:convert';

import 'staff_info.dart';

class DepartmentModel {
  List<Staff>? staffInfo;
  bool? hasNext;
  bool? hasPrevious;
  int? nextPageNumber;
  int? previousPageNumber;

  DepartmentModel({
    this.staffInfo,
    this.hasNext,
    this.hasPrevious,
    this.nextPageNumber,
    this.previousPageNumber,
  });

  @override
  String toString() {
    return 'DepartmentModel(staffInfo: $staffInfo, hasNext: $hasNext, hasPrevious: $hasPrevious, nextPageNumber: $nextPageNumber, previousPageNumber: $previousPageNumber)';
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> data) => DepartmentModel(
        staffInfo: (data['staff_info'] as List<dynamic>?)
            ?.map((e) => Staff.fromMap(e as Map<String, dynamic>))
            .toList(),
        hasNext: data['has_next'] as bool?,
        hasPrevious: data['has_previous'] as bool?,
        nextPageNumber: data['next_page_number'] as int?,
        previousPageNumber: data['previous_page_number'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'staff_info': staffInfo?.map((e) => e.toMap()).toList(),
        'has_next': hasNext,
        'has_previous': hasPrevious,
        'next_page_number': nextPageNumber,
        'previous_page_number': previousPageNumber,
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

  DepartmentModel copyWith({
    List<Staff>? staffInfo,
    bool? hasNext,
    bool? hasPrevious,
    int? nextPageNumber,
    int? previousPageNumber,
  }) {
    return DepartmentModel(
      staffInfo: staffInfo ?? this.staffInfo,
      hasNext: hasNext ?? this.hasNext,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      nextPageNumber: nextPageNumber ?? this.nextPageNumber,
      previousPageNumber: previousPageNumber ?? this.previousPageNumber,
    );
  }
}
