import 'dart:convert';

class UserRoleModel {
  String? role;

  UserRoleModel({this.role});

  @override
  String toString() => 'UserRoleModel(role: $role)';

  factory UserRoleModel.fromMap(Map<String, dynamic> data) => UserRoleModel(
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserRoleModel].
  factory UserRoleModel.fromJson(String data) {
    return UserRoleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserRoleModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserRoleModel copyWith({
    String? role,
  }) {
    return UserRoleModel(
      role: role ?? this.role,
    );
  }
}
