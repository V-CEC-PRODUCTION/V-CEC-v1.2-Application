part of 'verify_email_cubit.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
    required OtpModel? otpModel,
  }) = _Initial;
  factory VerifyEmailState.initial() {
    return _Initial(
      isLoading: false,
      isFailureOrSuccess: none(),
      otpModel: null,
    );
  }
}
