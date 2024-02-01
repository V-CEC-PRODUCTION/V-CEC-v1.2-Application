import 'dart:convert';

class Staff {
  int? id;
  String? name;
  String? designation;
  String? emailId;
  String? mobileNo;
  String? department;

  Staff({
    this.id,
    this.name,
    this.designation,
    this.emailId,
    this.mobileNo,
    this.department,
  });

  @override
  String toString() {
    return 'Staff(id: $id, name: $name, designation: $designation, emailId: $emailId, mobileNo: $mobileNo, department: $department)';
  }

  factory Staff.fromMap(Map<String, dynamic> data) => Staff(
        id: data['id'] as int?,
        name: data['name'] as String?,
        designation: data['designation'] as String?,
        emailId: data['email_id'] as String?,
        mobileNo: data['mobile_no'] as String?,
        department: data['department'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'designation': designation,
        'email_id': emailId,
        'mobile_no': mobileNo,
        'department': department,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Staff].
  factory Staff.fromJson(String data) {
    return Staff.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Staff] to a JSON string.
  String toJson() => json.encode(toMap());

  Staff copyWith({
    int? id,
    String? name,
    String? designation,
    String? emailId,
    String? mobileNo,
    String? department,
  }) {
    return Staff(
      id: id ?? this.id,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      emailId: emailId ?? this.emailId,
      mobileNo: mobileNo ?? this.mobileNo,
      department: department ?? this.department,
    );
  }
}
