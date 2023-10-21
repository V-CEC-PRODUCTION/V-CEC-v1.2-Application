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
  Option<Either<MainFailure, bool>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get submit => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;

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
      {Option<Either<MainFailure, bool>> failureOrSuccess,
      bool submit,
      bool loading,
      String deviceId});
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
    Object? submit = null,
    Object? loading = null,
    Object? deviceId = null,
  }) {
    return _then(_value.copyWith(
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      submit: null == submit
          ? _value.submit
          : submit // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {Option<Either<MainFailure, bool>> failureOrSuccess,
      bool submit,
      bool loading,
      String deviceId});
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
    Object? submit = null,
    Object? loading = null,
    Object? deviceId = null,
  }) {
    return _then(_$_EmailState(
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
      submit: null == submit
          ? _value.submit
          : submit // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmailState implements _EmailState {
  const _$_EmailState(
      {required this.failureOrSuccess,
      required this.submit,
      required this.loading,
      required this.deviceId});

  @override
  final Option<Either<MainFailure, bool>> failureOrSuccess;
  @override
  final bool submit;
  @override
  final bool loading;
  @override
  final String deviceId;

  @override
  String toString() {
    return 'EmailState(failureOrSuccess: $failureOrSuccess, submit: $submit, loading: $loading, deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailState &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess) &&
            (identical(other.submit, submit) || other.submit == submit) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, failureOrSuccess, submit, loading, deviceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailStateCopyWith<_$_EmailState> get copyWith =>
      __$$_EmailStateCopyWithImpl<_$_EmailState>(this, _$identity);
}

abstract class _EmailState implements EmailState {
  const factory _EmailState(
      {required final Option<Either<MainFailure, bool>> failureOrSuccess,
      required final bool submit,
      required final bool loading,
      required final String deviceId}) = _$_EmailState;

  @override
  Option<Either<MainFailure, bool>> get failureOrSuccess;
  @override
  bool get submit;
  @override
  bool get loading;
  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_EmailStateCopyWith<_$_EmailState> get copyWith =>
      throw _privateConstructorUsedError;
}
