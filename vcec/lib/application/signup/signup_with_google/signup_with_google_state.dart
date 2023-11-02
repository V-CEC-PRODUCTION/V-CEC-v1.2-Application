part of 'signup_with_google_cubit.dart';

@freezed
class SignupWithGoogleState with _$SignupWithGoogleState {
  const factory SignupWithGoogleState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
  }) = _Initial;
  factory SignupWithGoogleState.initial() {
    return _Initial(
      isLoading: false,
      isFailureOrSuccess: none(),
    );
  }
}
