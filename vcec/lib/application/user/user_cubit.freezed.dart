// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  User? get user => throw _privateConstructorUsedError;
  Option<Either<MainFailure, bool>> get authfailureorsuccess =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, bool>> get FailureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {User? user,
      Option<Either<MainFailure, bool>> authfailureorsuccess,
      Option<Either<MainFailure, bool>> FailureOrSuccess,
      bool loading,
      bool value});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? authfailureorsuccess = null,
    Object? FailureOrSuccess = null,
    Object? loading = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      authfailureorsuccess: null == authfailureorsuccess
          ? _value.authfailureorsuccess
          : authfailureorsuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      FailureOrSuccess: null == FailureOrSuccess
          ? _value.FailureOrSuccess
          : FailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      Option<Either<MainFailure, bool>> authfailureorsuccess,
      Option<Either<MainFailure, bool>> FailureOrSuccess,
      bool loading,
      bool value});
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_UserState>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? authfailureorsuccess = null,
    Object? FailureOrSuccess = null,
    Object? loading = null,
    Object? value = null,
  }) {
    return _then(_$_UserState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      authfailureorsuccess: null == authfailureorsuccess
          ? _value.authfailureorsuccess
          : authfailureorsuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      FailureOrSuccess: null == FailureOrSuccess
          ? _value.FailureOrSuccess
          : FailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserState implements _UserState {
  const _$_UserState(
      {required this.user,
      required this.authfailureorsuccess,
      required this.FailureOrSuccess,
      required this.loading,
      required this.value});

  @override
  final User? user;
  @override
  final Option<Either<MainFailure, bool>> authfailureorsuccess;
  @override
  final Option<Either<MainFailure, bool>> FailureOrSuccess;
  @override
  final bool loading;
  @override
  final bool value;

  @override
  String toString() {
    return 'UserState(user: $user, authfailureorsuccess: $authfailureorsuccess, FailureOrSuccess: $FailureOrSuccess, loading: $loading, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.authfailureorsuccess, authfailureorsuccess) ||
                other.authfailureorsuccess == authfailureorsuccess) &&
            (identical(other.FailureOrSuccess, FailureOrSuccess) ||
                other.FailureOrSuccess == FailureOrSuccess) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, authfailureorsuccess,
      FailureOrSuccess, loading, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {required final User? user,
      required final Option<Either<MainFailure, bool>> authfailureorsuccess,
      required final Option<Either<MainFailure, bool>> FailureOrSuccess,
      required final bool loading,
      required final bool value}) = _$_UserState;

  @override
  User? get user;
  @override
  Option<Either<MainFailure, bool>> get authfailureorsuccess;
  @override
  Option<Either<MainFailure, bool>> get FailureOrSuccess;
  @override
  bool get loading;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
