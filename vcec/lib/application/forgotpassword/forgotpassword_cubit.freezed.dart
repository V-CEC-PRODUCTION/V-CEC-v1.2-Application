// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgotpassword_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordState {
  Option<Either<MainFailure, bool>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call({Option<Either<MainFailure, bool>> isFailureOrSuccess});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForogtPasswordStateImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$ForogtPasswordStateImplCopyWith(_$ForogtPasswordStateImpl value,
          $Res Function(_$ForogtPasswordStateImpl) then) =
      __$$ForogtPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Option<Either<MainFailure, bool>> isFailureOrSuccess});
}

/// @nodoc
class __$$ForogtPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ForogtPasswordStateImpl>
    implements _$$ForogtPasswordStateImplCopyWith<$Res> {
  __$$ForogtPasswordStateImplCopyWithImpl(_$ForogtPasswordStateImpl _value,
      $Res Function(_$ForogtPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$ForogtPasswordStateImpl(
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ));
  }
}

/// @nodoc

class _$ForogtPasswordStateImpl implements _ForogtPasswordState {
  const _$ForogtPasswordStateImpl({required this.isFailureOrSuccess});

  @override
  final Option<Either<MainFailure, bool>> isFailureOrSuccess;

  @override
  String toString() {
    return 'ForgotPasswordState(isFailureOrSuccess: $isFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForogtPasswordStateImpl &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForogtPasswordStateImplCopyWith<_$ForogtPasswordStateImpl> get copyWith =>
      __$$ForogtPasswordStateImplCopyWithImpl<_$ForogtPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForogtPasswordState implements ForgotPasswordState {
  const factory _ForogtPasswordState(
      {required final Option<Either<MainFailure, bool>>
          isFailureOrSuccess}) = _$ForogtPasswordStateImpl;

  @override
  Option<Either<MainFailure, bool>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$ForogtPasswordStateImplCopyWith<_$ForogtPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
