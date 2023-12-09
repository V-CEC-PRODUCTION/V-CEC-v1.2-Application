import 'dart:convert';

class ProfileModel {
  String? name;
  String? email;
  String? branch;
  String? imageUrl;
  dynamic thumbnailUrl;
  String? semester;
  String? division;
  String? admissionNo;
  String? registerNo;
  String? ieeeNo;

  ProfileModel({
    this.name,
    this.email,
    this.branch,
    this.imageUrl,
    this.thumbnailUrl,
    this.semester,
    this.division,
    this.admissionNo,
    this.registerNo,
    this.ieeeNo,
  });

  @override
  String toString() {
    return 'ProfileModel(name: $name, email: $email, branch: $branch, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, semester: $semester, division: $division, admissionNo: $admissionNo, registerNo: $registerNo, ieee_membership_no: $ieeeNo)';
  }

  factory ProfileModel.fromMap(Map<String, dynamic> data) => ProfileModel(
        name: data['name'] as String?,
        email: data['email'] as String?,
        branch: data['branch'] as String?,
        imageUrl: data['image_url'] as String?,
        thumbnailUrl: data['thumbnail_url'] as dynamic,
        semester: data['semester'] as String?,
        division: data['division'] as String?,
        admissionNo: data['admission_no'] as String?,
        registerNo: data['register_no'] as String?,
        ieeeNo: data['ieee_membership_no'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'branch': branch,
        'image_url': imageUrl,
        'thumbnail_url': thumbnailUrl,
        'semester': semester,
        'division': division,
        'admission_no': admissionNo,
        'register_no': registerNo,
        'ieee_membership_no': ieeeNo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileModel].
  factory ProfileModel.fromJson(String data) {
    return ProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
