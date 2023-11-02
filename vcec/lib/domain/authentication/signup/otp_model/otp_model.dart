class OtpModel {
  OtpModel({
    required this.message,
    required this.otp,
  });

  final String message;
  final String? otp;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        message: json["message"],
        otp: json["otp"],
      );
}
