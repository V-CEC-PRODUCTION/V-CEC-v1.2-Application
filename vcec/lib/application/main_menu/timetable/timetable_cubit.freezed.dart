// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimetableState {
  TimetableModel? get timetable => throw _privateConstructorUsedError;
  Option<Either<MainFailure, TimetableModel>> get timetableFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimetableStateCopyWith<TimetableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableStateCopyWith<$Res> {
  factory $TimetableStateCopyWith(
          TimetableState value, $Res Function(TimetableState) then) =
      _$TimetableStateCopyWithImpl<$Res, TimetableState>;
  @useResult
  $Res call(
      {TimetableModel? timetable,
      Option<Either<MainFailure, TimetableModel>> timetableFailureOrSuccess});
}

/// @nodoc
class _$TimetableStateCopyWithImpl<$Res, $Val extends TimetableState>
    implements $TimetableStateCopyWith<$Res> {
  _$TimetableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetable = freezed,
    Object? timetableFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      timetable: freezed == timetable
          ? _value.timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as TimetableModel?,
      timetableFailureOrSuccess: null == timetableFailureOrSuccess
          ? _value.timetableFailureOrSuccess
          : timetableFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, TimetableModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $TimetableStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimetableModel? timetable,
      Option<Either<MainFailure, TimetableModel>> timetableFailureOrSuccess});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TimetableStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timetable = freezed,
    Object? timetableFailureOrSuccess = null,
  }) {
    return _then(_$_Initial(
      timetable: freezed == timetable
          ? _value.timetable
          : timetable // ignore: cast_nullable_to_non_nullable
              as TimetableModel?,
      timetableFailureOrSuccess: null == timetableFailureOrSuccess
          ? _value.timetableFailureOrSuccess
          : timetableFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, TimetableModel>>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.timetable, required this.timetableFailureOrSuccess});

  @override
  final TimetableModel? timetable;
  @override
  final Option<Either<MainFailure, TimetableModel>> timetableFailureOrSuccess;

  @override
  String toString() {
    return 'TimetableState(timetable: $timetable, timetableFailureOrSuccess: $timetableFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.timetable, timetable) ||
                other.timetable == timetable) &&
            (identical(other.timetableFailureOrSuccess,
                    timetableFailureOrSuccess) ||
                other.timetableFailureOrSuccess == timetableFailureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, timetable, timetableFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements TimetableState {
  const factory _Initial(
      {required final TimetableModel? timetable,
      required final Option<Either<MainFailure, TimetableModel>>
          timetableFailureOrSuccess}) = _$_Initial;

  @override
  TimetableModel? get timetable;
  @override
  Option<Either<MainFailure, TimetableModel>> get timetableFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
