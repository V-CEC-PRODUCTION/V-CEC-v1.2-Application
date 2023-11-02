import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/authentication/signup/otp_model/otp_model.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/authentication/signup/user_details_enum/user_details.dart';
import 'package:vcec/domain/authentication/token_model/token_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: SignupService)
class SignupRepo extends SignupService {
  @override
  Future<Either<MainFailure, OtpModel>> verifyEmail(
      {required String email}) async {
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
        "${baseUrl}users/auth/send-otp/",
        data: {"email": email},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final OtpModel otpModel = OtpModel.fromJson(response.data);
        AuthTokenManager.instance.setEmail(email);
        return Right(otpModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, void>> signUp(
      {required String email, required String password}) async {
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
        "${baseUrl}users/auth/sign-up/email/",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final tokenModel = TokenModel.fromJson(response.data);
        AuthTokenManager.instance.setTokens(
            accessToken: tokenModel.accessToken!,
            refreshToken: tokenModel.refreshToken!);
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  } 

  @override
  Future<Either<MainFailure, void>> postUserDetails(
      {required UserDetailsModel userDetailsModel}) async {
    final manager = AuthTokenManager.instance;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String deviceId = androidInfo.id;

    Object data = {
      "name": userDetailsModel.fullName,
      "branch": userDetailsModel.branch ?? "",
      "semester": userDetailsModel.semester ?? "",
      "division": userDetailsModel.batch ?? "",
      "admission_no": userDetailsModel.adNumber ?? "",
      "gender": userDetailsModel.gender ?? "",
      "device_id": deviceId,
    };

    try {
      final response = await Dio(BaseOptions(
              headers: {"Authorization": "Bearer ${manager.accessToken}"}))
          .post("${baseUrl}users/auth/add/user/detail/", data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 401) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, void>> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
    } catch (e) {
      print("BLAA$e");
    }

    return const Right(null);
  }

  @override
  Future<Either<MainFailure, void>> signUpWithGooglePost(
      {required String email}) {
    throw UnimplementedError();
  }

  @override
  Future signupEmailCheck({required UserDetailsModel userDetailsModel}) {
    // TODO: implement signupEmailCheck
    throw UnimplementedError();
  }
}
