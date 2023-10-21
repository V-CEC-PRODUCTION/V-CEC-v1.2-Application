part of 'adduser_cubit.dart';

@freezed
class AddUserState with _$AddUserState {
  const factory AddUserState({
    required bool value,
  }) = _AddUserState;
  factory AddUserState.initial() => AddUserState(value: true);
}
