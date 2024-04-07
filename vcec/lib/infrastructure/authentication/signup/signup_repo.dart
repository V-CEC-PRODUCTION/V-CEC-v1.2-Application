import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
class SignupRepo implements SignupService {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  SignupRepo(this.firebaseAuth, this.googleSignIn);
  @override
  Future<Either<MainFailure, OtpModel>> verifyEmail(
      {required String email}) async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final Response response = await Dio(BaseOptions(headers: headers)).post(
        "${baseUrl}users/auth/send-otp/",
        data: {"email": email},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final OtpModel otpModel = OtpModel.fromJson(response.data);
        AuthTokenManager.instance.setEmail(email);
        AuthTokenManager.instance.setLoginType(LoginType.email);
        return Right(otpModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 409) {
        return const Left(MainFailure.authFailure());
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

    String deviceId = await FirebaseMessaging.instance.getToken() ?? "";

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
      log(e.toString());
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
  Future<Either<MainFailure, User>> signUpWithGoogle() async {
    try {
      final googleuser = await googleSignIn.signIn();

      final googleAuthentification = await googleuser!.authentication;
      final authcredential = GoogleAuthProvider.credential(
          idToken: googleAuthentification.idToken,
          accessToken: googleAuthentification.accessToken);
      final user = firebaseAuth
          .signInWithCredential(authcredential)
          .then((value) => value.user);
      final email1 = await user.then((value) => value!.email);
      AuthTokenManager.instance.setEmail(email1!);
      final googleEmail = AuthTokenManager.instance.email;
      final end = googleEmail!.substring((googleEmail.length) - 13);
      if (end == "ceconline.edu") {
        AuthTokenManager.instance.setUserRole(UserRole.student);
      } else {
        AuthTokenManager.instance.setUserRole(UserRole.guest);
      }

      return firebaseAuth
          .signInWithCredential(authcredential)
          .then((r) => Right(r.user!));
    } on FirebaseAuthException catch (_) {
      return left(const MainFailure.serverFailure());
    } catch (e) {
      return left(const MainFailure.otherFailure());
    }
  }

  @override
  Future<Either<MainFailure, void>> signUpWithGooglePost(
      {required String email}) async {
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
        "${baseUrl}users/auth/check/email/exist/",
        data: {"email": email, "login_type": 'google'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthTokenManager.instance.setLoginType(LoginType.google);
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is DioException && e.response?.statusCode == 409) {
        AuthTokenManager.instance.setLoginType(LoginType.google);
        return const Left(MainFailure.incorrectCredential());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Right(null);
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future signupEmailCheck({required UserDetailsModel userDetailsModel}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    return Future.wait([googleSignIn.signOut(), firebaseAuth.signOut()]);
  }

  @override
  Future<Either<MainFailure, void>> logOut() async {
    try {
      final manager = AuthTokenManager.instance;
      final response = await Dio(BaseOptions(
              headers: {"Authorization": "Bearer ${manager.accessToken}"}))
          .post("${baseUrl}users/auth/logout/api/token/");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(null);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log("logout $e");
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
  Future<Either<MainFailure, void>> signUpWithGoogleFromAccounts({
    required String email,
  }) async {
    try {
      final Response response = await Dio(BaseOptions(headers: {
        "Content-Type": "application/json",
      })).post(
        "${baseUrl}users/auth/sign-up/google/",
        data: {
          "email": email,
        },
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
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
