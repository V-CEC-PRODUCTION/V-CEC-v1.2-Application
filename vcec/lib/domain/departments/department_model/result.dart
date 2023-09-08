import 'dart:convert';

class Staff {
  String? department;
  String? designation;
  String? emailId;
  int? id;
  String? imageUrl;
  String? name;
  int? phoneNo;
  int? roomNo;

  Staff({
    this.department,
    this.designation,
    this.emailId,
    this.id,
    this.imageUrl,
    this.name,
    this.phoneNo,
    this.roomNo,
  });

  @override
  String toString() {
    return 'Staff(department: $department, designation: $designation, emailId: $emailId, id: $id, imageUrl: $imageUrl, name: $name, phoneNo: $phoneNo, roomNo: $roomNo)';
  }

  factory Staff.fromMap(Map<String, dynamic> data) => Staff(
        department: data['department'] as String?,
        designation: data['designation'] as String?,
        emailId: data['email_id'] as String?,
        id: data['id'] as int?,
        imageUrl: data['image_url'] as String?,
        name: data['name'] as String?,
        phoneNo: int.parse(data['phone_no']),
        roomNo: data['room_no'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'department': department,
        'designation': designation,
        'email_id': emailId,
        'id': id,
        'image_url': imageUrl,
        'name': name,
        'phone_no': phoneNo,
        'room_no': roomNo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the Staffing Json object as [Staff].
  factory Staff.fromJson(String data) {
    return Staff.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Staff] to a JSON string.
  String toJson() => json.encode(toMap());
}
