part of 'log_out_cubit.dart';

@freezed
class LogOutState with _$LogOutState {
  const factory LogOutState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
  }) = _LogOutState;
  factory LogOutState.initial() =>
      LogOutState(isLoading: false, isFailureOrSuccess: none());
}
