import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/authentication/signup/otp_model/otp_model.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

@injectable
class VerifyEmailAndSignUpWithGoogleCubit
    extends Cubit<VerifyEmailAndSignUpWithGoogleState> {
  final SignupService _signupService;
  VerifyEmailAndSignUpWithGoogleCubit(this._signupService)
      : super(VerifyEmailAndSignUpWithGoogleState.initial());
  verifyEmail({required String email}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _signupService.verifyEmail(email: email);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(null)),
        otpModel: r,
      ));
    });
  }

  signInWithGoogle() async {
    emit(state.copyWith(isFailureOrSuccessForGoogle: none(), isLoading: true));
    final response = await _signupService.signUpWithGoogle();
    response.fold(
        (l) => emit(state.copyWith(
            isFailureOrSuccessForGoogle: none(), isLoading: false)), (r) async {
      final emailExistResponse =
          await _signupService.signUpWithGooglePost(email: r.email!);
      emailExistResponse.fold(
          (l) => {
                emit(state.copyWith(
                    isFailureOrSuccessForGoogle: some(left(l)),
                    isLoading: false)),
                if (l == const MainFailure.incorrectCredential())
                  {_signupService.signOut()}
              },
          (r) => {
                emit(state.copyWith(
                    isFailureOrSuccessForGoogle: some(right(r)),
                    isLoading: false))
              });
    });
  }

  signOut() async {
    await _signupService.signOut();
  }
}
