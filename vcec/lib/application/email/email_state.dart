part of 'email_cubit.dart';

@freezed
class EmailState with _$EmailState{
  const factory EmailState(
    {
      required Option<Either<MainFailure,EmailModel>> failureOrSuccess,
      required EmailModel? accessToken
    }
  ) = _EmailState;
  factory EmailState.initial() => EmailState(
      failureOrSuccess: none(), accessToken: null);
      
}
