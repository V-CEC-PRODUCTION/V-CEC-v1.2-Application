part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailAndSignUpWithGoogleState
    with _$VerifyEmailAndSignUpWithGoogleState {
  const factory VerifyEmailAndSignUpWithGoogleState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
    required Option<Either<MainFailure, void>> isFailureOrSuccessForGoogle,
    required OtpModel? otpModel,
  }) = _Initial;
  factory VerifyEmailAndSignUpWithGoogleState.initial() {
    return _Initial(
        isLoading: false,
        isFailureOrSuccess: none(),
        otpModel: null,
        isFailureOrSuccessForGoogle: none());
  }
}
