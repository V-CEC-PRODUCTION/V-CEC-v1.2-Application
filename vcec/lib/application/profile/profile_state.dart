part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required Option<Either<MainFailure, ProfileModel>> failureOrSuccess,
    required ProfileModel? profileModel,
    required bool hasEdited,
  }) = _Initial;

  factory ProfileState.initail() {
    return _Initial(
      isLoading: false,
      failureOrSuccess: none(),
      profileModel: null,
      hasEdited: false,
    );
  }
}
