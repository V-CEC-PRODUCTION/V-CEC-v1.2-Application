// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailState {
  Option<Either<MainFailure, EmailModel>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  EmailModel? get accessToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailStateCopyWith<EmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailStateCopyWith<$Res> {
  factory $EmailStateCopyWith(
          EmailState value, $Res Function(EmailState) then) =
      _$EmailStateCopyWithImpl<$Res, EmailState>;
  @useResult
  $Res call(
      {Option<Either<MainFailure, EmailModel>> failureOrSuccess,
      EmailModel? accessToken});
}

/// @nodoc
class _$EmailStateCopyWithImpl<$Res, $Val extends EmailState>
    implements $EmailStateCopyWith<$Res> {
  _$EmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSuccess = null,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, EmailModel>>,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as EmailModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailStateCopyWith<$Res>
    implements $EmailStateCopyWith<$Res> {
  factory _$$_EmailStateCopyWith(
          _$_EmailState value, $Res Function(_$_EmailState) then) =
      __$$_EmailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<MainFailure, EmailModel>> failureOrSuccess,
      EmailModel? accessToken});
}

/// @nodoc
class __$$_EmailStateCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$_EmailState>
    implements _$$_EmailStateCopyWith<$Res> {
  __$$_EmailStateCopyWithImpl(
      _$_EmailState _value, $Res Function(_$_EmailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSuccess = null,
    Object? accessToken = freezed,
  }) {
    return _then(_$_EmailState(
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, EmailModel>>,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as EmailModel?,
    ));
  }
}

/// @nodoc

class _$_EmailState implements _EmailState {
  const _$_EmailState(
      {required this.failureOrSuccess, required this.accessToken});

  @override
  final Option<Either<MainFailure, EmailModel>> failureOrSuccess;
  @override
  final EmailModel? accessToken;

  @override
  String toString() {
    return 'EmailState(failureOrSuccess: $failureOrSuccess, accessToken: $accessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailState &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrSuccess, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailStateCopyWith<_$_EmailState> get copyWith =>
      __$$_EmailStateCopyWithImpl<_$_EmailState>(this, _$identity);
}

abstract class _EmailState implements EmailState {
  const factory _EmailState(
      {required final Option<Either<MainFailure, EmailModel>> failureOrSuccess,
      required final EmailModel? accessToken}) = _$_EmailState;

  @override
  Option<Either<MainFailure, EmailModel>> get failureOrSuccess;
  @override
  EmailModel? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$_EmailStateCopyWith<_$_EmailState> get copyWith =>
      throw _privateConstructorUsedError;
}
