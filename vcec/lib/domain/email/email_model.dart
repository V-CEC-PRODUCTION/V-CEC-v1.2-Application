import 'dart:convert';

class EmailModel {
  EmailModel._internal();
  static EmailModel instance = EmailModel._internal();
  String? accessToken;
  String? refreshToken;

  EmailModel({this.accessToken, this.refreshToken});

  @override
  String toString() {
    return 'EmailModel(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  factory EmailModel.fromMap(Map<String, dynamic> data) => EmailModel(
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EmailModel].
  factory EmailModel.fromJson(String data) {
    return EmailModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EmailModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
