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
     
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

     
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      
      print(result.user);
      return right(result.user!);
    } catch (e) {
      log(e.toString());
      return left(const MainFailure.serverFailure());
    }
  }
}
