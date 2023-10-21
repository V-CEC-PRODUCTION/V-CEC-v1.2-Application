part of 'email_cubit.dart';

@freezed
class EmailState with _$EmailState {
  const factory EmailState({
    required Option<Either<MainFailure, bool>> failureOrSuccess,
    required bool submit,
    required bool loading,
    required String deviceId
  }) = _EmailState;
  factory EmailState.initial() => EmailState(failureOrSuccess: none(), submit: true, loading: true, deviceId: '');
}
