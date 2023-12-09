part of 'login_cubit.dart';

@freezed
class LoginWithEmailAndGoogleState with _$LoginWithEmailAndGoogleState {
  const factory LoginWithEmailAndGoogleState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
    required Option<Either<MainFailure, void>> isFailureOrSuccessForGoogle,
  }) = _Initial;
  factory LoginWithEmailAndGoogleState.initial() {
    return _Initial(
        isLoading: false,
        isFailureOrSuccess: none(),
        isFailureOrSuccessForGoogle: none());
  }
}
