import 'dart:convert'; // Import this for JSON handling
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../domain/auth/otp_model.dart';
import '../../domain/auth/verification_service.dart';
import '../../domain/failure/main_failure.dart';
import '../../strings/strings.dart'; // Import the http package

// ...

@LazySingleton(as: VerificationService)
class VerificationRepository extends VerificationService {
  @override
  Future<Either<MainFailure, OtpModel>> postCode(String code) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}users/auth/verify-otp/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "user_otp": code,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final OtpModel message = OtpModel.fromJson(jsonDecode(response.body));
        return Right(message);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      log('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}
