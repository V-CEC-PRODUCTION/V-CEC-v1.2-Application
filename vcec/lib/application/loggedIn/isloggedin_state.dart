part of 'isloggedin_cubit.dart';

@freezed
class IsLoggedInState with _$IsLoggedInState {
  const factory IsLoggedInState({required String page,
  required String msg}) = _IsLoggedInState;
 factory IsLoggedInState.initial() =>const IsLoggedInState(page: 'login', msg: '');
}
