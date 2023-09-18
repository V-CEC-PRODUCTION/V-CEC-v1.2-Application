part of 'verification_cubit.dart';
@freezed
class VerificationState with _$VerificationState {
  const factory VerificationState({
    required Option<Either<MainFailure, OtpModel>>
        otpFailureOrSuccess,
  }) = _VerificationState;
  factory VerificationState.initial() {
    return _VerificationState(
      otpFailureOrSuccess: none(),
    );
  }
}