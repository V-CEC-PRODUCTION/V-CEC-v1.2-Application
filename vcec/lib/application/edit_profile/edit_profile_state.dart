part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required bool isLoading,
    required Option<Either<MainFailure, bool>> failureOrSuccesss,
  }) = _Initial;

  factory EditProfileState.initial() =>
      EditProfileState(isLoading: false, failureOrSuccesss: none());
}
