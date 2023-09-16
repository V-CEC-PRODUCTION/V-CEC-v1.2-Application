part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required Option<Either<MainFailure, OtpModel>>
        otpFailureOrSuccess,
  }) = _OtpState;
  factory OtpState.initial() {
    return _OtpState(
      otpFailureOrSuccess: none(),
    );
  }
}
