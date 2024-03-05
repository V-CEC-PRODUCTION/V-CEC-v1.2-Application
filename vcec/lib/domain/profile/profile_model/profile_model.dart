class ProfileModel {
  final int id;
  final String name;
  final String email;
  final String? branch;
  final String? imageUrl;
  final String? thumbnailUrl;
  final String? semester;
  final String? division;
  final String? admissionNo;
  final String? registerNo;
  final String? ieeeMembershipNo;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.branch,
    this.imageUrl,
    this.thumbnailUrl,
    this.semester,
    this.division,
    this.admissionNo,
    this.registerNo,
    this.ieeeMembershipNo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? " ",
      name: json['name'] ?? " ",
      email: json['email'] ?? " ",
      branch: json['branch'] ?? " ",
      imageUrl: json['image_url'] ?? " ",
      thumbnailUrl: json['thumbnail_url'] ?? " ",
      semester: json['semester'] ?? " ",
      division: json['division'] ?? " ",
      admissionNo: json['admission_no'] ?? " ",
      registerNo: json['register_no'] ?? "",
      ieeeMembershipNo: json['ieee_membership_no'] ?? " ",
    );
  }
}
