part of 'google_cubit.dart';

@freezed
class GoogleState with _$GoogleState {
  const factory GoogleState({
    required bool isSubmitting,
    required User? user,
    required OtpModel? otp,
    required Option<Either<MainFailure, bool>> authfailureorsuccess,
    required Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess,
    required Option<Either<MainFailure, bool>> FailureOrSuccess,
    required String deviceId,
    required bool loading
  }) = _GoogleState;
  factory GoogleState.initial() => GoogleState(
      isSubmitting: true,
      user: null,
      authfailureorsuccess: none(),
      otpFailureOrSuccess: none(),
      otp: null, FailureOrSuccess: none(), deviceId: '', loading: true);
}
