class UserDetailsModel {
  final String fullName;
  final String? branch;
  final String? semester;
  final String? batch;
  final String? gender;
  final String? adNumber;

  UserDetailsModel(
      {required this.fullName,
      this.branch,
      this.semester,
      this.batch,
      this.gender,
      this.adNumber});
}
