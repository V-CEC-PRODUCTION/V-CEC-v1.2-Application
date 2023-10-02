import 'dart:convert';

class OtpModel {
  String? message;
  String? otp;

  OtpModel({this.message, this.otp});

  @override
  String toString() => 'OtpModel(message: $message, otp: $otp)';

  factory OtpModel.fromMap(Map<String, dynamic> data) => OtpModel(
        message: data['message'] as String?,
        otp: data['otp'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'otp': otp,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OtpModel].
  factory OtpModel.fromJson(String data) {
    return OtpModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OtpModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
