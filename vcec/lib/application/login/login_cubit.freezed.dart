// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginWithEmailAndGoogleState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, void>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, void>> get isFailureOrSuccessForGoogle =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginWithEmailAndGoogleStateCopyWith<LoginWithEmailAndGoogleState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithEmailAndGoogleStateCopyWith<$Res> {
  factory $LoginWithEmailAndGoogleStateCopyWith(
          LoginWithEmailAndGoogleState value,
          $Res Function(LoginWithEmailAndGoogleState) then) =
      _$LoginWithEmailAndGoogleStateCopyWithImpl<$Res,
          LoginWithEmailAndGoogleState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, void>> isFailureOrSuccess,
      Option<Either<MainFailure, void>> isFailureOrSuccessForGoogle});
}

/// @nodoc
class _$LoginWithEmailAndGoogleStateCopyWithImpl<$Res,
        $Val extends LoginWithEmailAndGoogleState>
    implements $LoginWithEmailAndGoogleStateCopyWith<$Res> {
  _$LoginWithEmailAndGoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isFailureOrSuccessForGoogle = null,
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
      isFailureOrSuccessForGoogle: null == isFailureOrSuccessForGoogle
          ? _value.isFailureOrSuccessForGoogle
          : isFailureOrSuccessForGoogle // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LoginWithEmailAndGoogleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailure, void>> isFailureOrSuccess,
      Option<Either<MainFailure, void>> isFailureOrSuccessForGoogle});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginWithEmailAndGoogleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isFailureOrSuccessForGoogle = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
      isFailureOrSuccessForGoogle: null == isFailureOrSuccessForGoogle
          ? _value.isFailureOrSuccessForGoogle
          : isFailureOrSuccessForGoogle // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, void>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading,
      required this.isFailureOrSuccess,
      required this.isFailureOrSuccessForGoogle});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, void>> isFailureOrSuccess;
  @override
  final Option<Either<MainFailure, void>> isFailureOrSuccessForGoogle;

  @override
  String toString() {
    return 'LoginWithEmailAndGoogleState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess, isFailureOrSuccessForGoogle: $isFailureOrSuccessForGoogle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess) &&
            (identical(other.isFailureOrSuccessForGoogle,
                    isFailureOrSuccessForGoogle) ||
                other.isFailureOrSuccessForGoogle ==
                    isFailureOrSuccessForGoogle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isFailureOrSuccess, isFailureOrSuccessForGoogle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements LoginWithEmailAndGoogleState {
  const factory _Initial(
      {required final bool isLoading,
      required final Option<Either<MainFailure, void>> isFailureOrSuccess,
      required final Option<Either<MainFailure, void>>
          isFailureOrSuccessForGoogle}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, void>> get isFailureOrSuccess;
  @override
  Option<Either<MainFailure, void>> get isFailureOrSuccessForGoogle;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
