import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vcec/domain/authentication/signup/otp_model/otp_model.dart';
import 'package:vcec/domain/authentication/signup/user_details_enum/user_details.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class SignupService {
  Future<Either<MainFailure, OtpModel>> verifyEmail({required String email});
  Future<Either<MainFailure, void>> signUp(
      {required String email, required String password});
  Future<Either<MainFailure, User>> signUpWithGoogle();
  Future<Either<MainFailure, void>> signUpWithGooglePost({
    required String email,
  });
  Future<Either<MainFailure, void>> signUpWithGoogleFromAccounts(
      {required String email});
  Future signupEmailCheck({required UserDetailsModel userDetailsModel});
  Future<Either<MainFailure, void>> postUserDetails(
      {required UserDetailsModel userDetailsModel});
  Future<void> signOut();
  Future<Either<MainFailure,void>> logOut();
}
