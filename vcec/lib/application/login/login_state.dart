part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required Option<Either<MainFailure, void>>
       isFailureOrSuccess,
  }) = _Initial;
  factory LoginState.initial() {
    return _Initial(
      isLoading: false,
      isFailureOrSuccess: none()
    );
  }
}
