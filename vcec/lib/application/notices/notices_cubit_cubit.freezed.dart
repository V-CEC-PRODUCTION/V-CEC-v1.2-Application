// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notices_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoticesState {
  Option<Either<MainFailure, List<NoticesResult>>> get cecfailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<NoticesResult>>> get ktufailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoticesStateCopyWith<NoticesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoticesStateCopyWith<$Res> {
  factory $NoticesStateCopyWith(
          NoticesState value, $Res Function(NoticesState) then) =
      _$NoticesStateCopyWithImpl<$Res, NoticesState>;
  @useResult
  $Res call(
      {Option<Either<MainFailure, List<NoticesResult>>> cecfailureOrSuccess,
      Option<Either<MainFailure, List<NoticesResult>>> ktufailureOrSuccess});
}

/// @nodoc
class _$NoticesStateCopyWithImpl<$Res, $Val extends NoticesState>
    implements $NoticesStateCopyWith<$Res> {
  _$NoticesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cecfailureOrSuccess = null,
    Object? ktufailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      cecfailureOrSuccess: null == cecfailureOrSuccess
          ? _value.cecfailureOrSuccess
          : cecfailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NoticesResult>>>,
      ktufailureOrSuccess: null == ktufailureOrSuccess
          ? _value.ktufailureOrSuccess
          : ktufailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NoticesResult>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NoticesStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<MainFailure, List<NoticesResult>>> cecfailureOrSuccess,
      Option<Either<MainFailure, List<NoticesResult>>> ktufailureOrSuccess});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NoticesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cecfailureOrSuccess = null,
    Object? ktufailureOrSuccess = null,
  }) {
    return _then(_$InitialImpl(
      cecfailureOrSuccess: null == cecfailureOrSuccess
          ? _value.cecfailureOrSuccess
          : cecfailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NoticesResult>>>,
      ktufailureOrSuccess: null == ktufailureOrSuccess
          ? _value.ktufailureOrSuccess
          : ktufailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NoticesResult>>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.cecfailureOrSuccess, required this.ktufailureOrSuccess});

  @override
  final Option<Either<MainFailure, List<NoticesResult>>> cecfailureOrSuccess;
  @override
  final Option<Either<MainFailure, List<NoticesResult>>> ktufailureOrSuccess;

  @override
  String toString() {
    return 'NoticesState(cecfailureOrSuccess: $cecfailureOrSuccess, ktufailureOrSuccess: $ktufailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.cecfailureOrSuccess, cecfailureOrSuccess) ||
                other.cecfailureOrSuccess == cecfailureOrSuccess) &&
            (identical(other.ktufailureOrSuccess, ktufailureOrSuccess) ||
                other.ktufailureOrSuccess == ktufailureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cecfailureOrSuccess, ktufailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements NoticesState {
  const factory _Initial(
      {required final Option<Either<MainFailure, List<NoticesResult>>>
          cecfailureOrSuccess,
      required final Option<Either<MainFailure, List<NoticesResult>>>
          ktufailureOrSuccess}) = _$InitialImpl;

  @override
  Option<Either<MainFailure, List<NoticesResult>>> get cecfailureOrSuccess;
  @override
  Option<Either<MainFailure, List<NoticesResult>>> get ktufailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
