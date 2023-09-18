// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerificationState {
  Option<Either<MainFailure, OtpModel>> get otpFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerificationStateCopyWith<VerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStateCopyWith<$Res> {
  factory $VerificationStateCopyWith(
          VerificationState value, $Res Function(VerificationState) then) =
      _$VerificationStateCopyWithImpl<$Res, VerificationState>;
  @useResult
  $Res call({Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess});
}

/// @nodoc
class _$VerificationStateCopyWithImpl<$Res, $Val extends VerificationState>
    implements $VerificationStateCopyWith<$Res> {
  _$VerificationStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_VerificationStateCopyWith<$Res>
    implements $VerificationStateCopyWith<$Res> {
  factory _$$_VerificationStateCopyWith(_$_VerificationState value,
          $Res Function(_$_VerificationState) then) =
      __$$_VerificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess});
}

/// @nodoc
class __$$_VerificationStateCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$_VerificationState>
    implements _$$_VerificationStateCopyWith<$Res> {
  __$$_VerificationStateCopyWithImpl(
      _$_VerificationState _value, $Res Function(_$_VerificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpFailureOrSuccess = null,
  }) {
    return _then(_$_VerificationState(
      otpFailureOrSuccess: null == otpFailureOrSuccess
          ? _value.otpFailureOrSuccess
          : otpFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, OtpModel>>,
    ));
  }
}

/// @nodoc

class _$_VerificationState implements _VerificationState {
  const _$_VerificationState({required this.otpFailureOrSuccess});

  @override
  final Option<Either<MainFailure, OtpModel>> otpFailureOrSuccess;

  @override
  String toString() {
    return 'VerificationState(otpFailureOrSuccess: $otpFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerificationState &&
            (identical(other.otpFailureOrSuccess, otpFailureOrSuccess) ||
                other.otpFailureOrSuccess == otpFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otpFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerificationStateCopyWith<_$_VerificationState> get copyWith =>
      __$$_VerificationStateCopyWithImpl<_$_VerificationState>(
          this, _$identity);
}

abstract class _VerificationState implements VerificationState {
  const factory _VerificationState(
      {required final Option<Either<MainFailure, OtpModel>>
          otpFailureOrSuccess}) = _$_VerificationState;

  @override
  Option<Either<MainFailure, OtpModel>> get otpFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_VerificationStateCopyWith<_$_VerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
