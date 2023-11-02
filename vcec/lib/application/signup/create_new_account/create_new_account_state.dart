part of 'create_new_account_cubit.dart';

@freezed
class CreateNewAccountState with _$CreateNewAccountState {
  const factory CreateNewAccountState({
    required bool isLoading,
    required Option<Either<MainFailure, void>> isFailureOrSuccess,
  }) = _Initial;
  factory CreateNewAccountState.initial() {
    return _Initial(
      isLoading: false,
      isFailureOrSuccess: none(),
    );
  }
}
