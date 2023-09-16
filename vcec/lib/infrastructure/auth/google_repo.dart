import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/google_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

@Injectable(as: Authservice)
class AuthRepository implements Authservice {
  final GoogleSignIn signInWithGoogle;
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.signInWithGoogle, this.firebaseAuth);
  @override
  Future<Either<MainFailure, Unit>> googleSignIn() async {
    try {
      final googleuser = await signInWithGoogle.signIn();
      if (googleuser == null) {
        return left(const MainFailure.clientFailure());
      }
      final googleAuthentification = await googleuser.authentication;
      final authcredential = GoogleAuthProvider.credential(
          idToken: googleAuthentification.idToken,
          accessToken: googleAuthentification.accessToken);
      return firebaseAuth
          .signInWithCredential(authcredential)
          .then((r) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const MainFailure.serverFailure());
    }
  }
}
