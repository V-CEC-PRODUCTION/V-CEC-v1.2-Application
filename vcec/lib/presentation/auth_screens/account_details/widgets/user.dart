enum Role { student, guest }

class UserRole {
  final Role role;
  final String name;
  final String? branch;
  final String? semester;
  final String? batch;
  final String? gender;
  final String? adno;
  final String id;

  UserRole({
    required this.name,
    this.branch,
    this.semester,
    this.batch,
    this.gender,
    this.adno,
    required this.id,
    required this.role,
  });
}
