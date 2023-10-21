part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    
    required User? user,
    required Option<Either<MainFailure, bool>> authfailureorsuccess,
    required Option<Either<MainFailure, bool>> FailureOrSuccess,
   
    required bool loading, required bool value
  }) = _UserState;
  factory UserState.initial() =>  UserState(value: true,   user: null, authfailureorsuccess: none(), FailureOrSuccess: none(), loading: true);
}
