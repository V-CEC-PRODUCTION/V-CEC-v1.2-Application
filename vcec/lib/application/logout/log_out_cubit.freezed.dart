// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_out_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogOutState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, void>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogOutStateCopyWith<LogOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogOutStateCopyWith<$Res> {
  factory $LogOutStateCopyWith(
          LogOutState value, $Res Function(LogOutState) then) =
      _$LogOutStateCopyWithImpl<$Res, LogOutState>;
  @useResult
  $Res call(
      {bool isLoading, Option<Either<MainFailure, void>> isFailureOrSuccess});
}

/// @nodoc
class _$LogOutStateCopyWithImpl<$Res, $Val extends LogOutState>
    implements $LogOutStateCopyWith<$Res> {
  _$LogOutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogOutStateImplCopyWith<$Res>
    implements $LogOutStateCopyWith<$Res> {
  factory _$$LogOutStateImplCopyWith(
          _$LogOutStateImpl value, $Res Function(_$LogOutStateImpl) then) =
      __$$LogOutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, Option<Either<MainFailure, void>> isFailureOrSuccess});
}

/// @nodoc
class __$$LogOutStateImplCopyWithImpl<$Res>
    extends _$LogOutStateCopyWithImpl<$Res, _$LogOutStateImpl>
    implements _$$LogOutStateImplCopyWith<$Res> {
  __$$LogOutStateImplCopyWithImpl(
      _$LogOutStateImpl _value, $Res Function(_$LogOutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$LogOutStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ));
  }
}

/// @nodoc

class _$LogOutStateImpl implements _LogOutState {
  const _$LogOutStateImpl(
      {required this.isLoading, required this.isFailureOrSuccess});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, void>> isFailureOrSuccess;

  @override
  String toString() {
    return 'LogOutState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogOutStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogOutStateImplCopyWith<_$LogOutStateImpl> get copyWith =>
      __$$LogOutStateImplCopyWithImpl<_$LogOutStateImpl>(this, _$identity);
}

abstract class _LogOutState implements LogOutState {
  const factory _LogOutState(
      {required final bool isLoading,
      required final Option<Either<MainFailure, void>>
          isFailureOrSuccess}) = _$LogOutStateImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, void>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$LogOutStateImplCopyWith<_$LogOutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
