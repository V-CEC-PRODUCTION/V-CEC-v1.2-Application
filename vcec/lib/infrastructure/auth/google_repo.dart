import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/google_service1.dart';
import 'package:vcec/domain/failure/main_failure.dart';

@Injectable(as: Authservice)
class AuthRepository implements Authservice {
  final GoogleSignIn signInWithGoogle;
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.signInWithGoogle, this.firebaseAuth);
  @override
  Future<Either<MainFailure, User>> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      log(result.user.toString());
      return right(result.user!);
    } catch (e) {
      log(e.toString());
      return left(const MainFailure.serverFailure());
    }
  }
}
