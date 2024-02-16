part of 'forgotpassword_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required Option<Either<MainFailure, bool>> isFailureOrSuccess,
  }) = _ForogtPasswordState;
  factory ForgotPasswordState.initial() => ForgotPasswordState(
        isFailureOrSuccess: none(),
      );
}
