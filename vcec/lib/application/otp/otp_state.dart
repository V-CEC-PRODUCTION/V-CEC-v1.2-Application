part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required OtpModel? otp,
    required Option<Either<MainFailure, OtpModel>>
        otpFailureOrSuccess,
        required bool value,
  }) = _OtpState;
  factory OtpState.initial() {
    return _OtpState(
      otpFailureOrSuccess: none(), value: true, otp: null,
      
    );
  }
}
