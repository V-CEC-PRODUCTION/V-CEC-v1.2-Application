// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpState {
  Option<Either<MainFailure, OtpModel>> get otpFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call({Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      otpFailureOrSuccess: null == otpFailureOrSuccess
          ? _value.otpFailureOrSuccess
          : otpFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, OtpModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$$_OtpStateCopyWith(
          _$_OtpState value, $Res Function(_$_OtpState) then) =
      __$$_OtpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess});
}

/// @nodoc
class __$$_OtpStateCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$_OtpState>
    implements _$$_OtpStateCopyWith<$Res> {
  __$$_OtpStateCopyWithImpl(
      _$_OtpState _value, $Res Function(_$_OtpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpFailureOrSuccess = null,
  }) {
    return _then(_$_OtpState(
      otpFailureOrSuccess: null == otpFailureOrSuccess
          ? _value.otpFailureOrSuccess
          : otpFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, OtpModel>>,
    ));
  }
}

/// @nodoc

class _$_OtpState implements _OtpState {
  const _$_OtpState({required this.otpFailureOrSuccess});

  @override
  final Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess;

  @override
  String toString() {
    return 'OtpState(otpFailureOrSuccess: $otpFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtpState &&
            (identical(other.otpFailureOrSuccess, otpFailureOrSuccess) ||
                other.otpFailureOrSuccess == otpFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otpFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      __$$_OtpStateCopyWithImpl<_$_OtpState>(this, _$identity);
}

abstract class _OtpState implements OtpState {
  const factory _OtpState(
      {required final Option<Either<MainFailure, OtpModel>>
          otpFailureOrSuccess}) = _$_OtpState;

  @override
  Option<Either<MainFailure, OtpModel>> get otpFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_OtpStateCopyWith<_$_OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}
