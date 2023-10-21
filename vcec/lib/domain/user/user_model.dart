import 'dart:convert';

class UserModel {
   UserModel._internal();
  static UserModel instance = UserModel._internal();
  String? role;

  UserModel({this.role});

  @override
  String toString() => 'UserModel(role: $role)';

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
