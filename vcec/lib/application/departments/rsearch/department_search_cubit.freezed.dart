// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DepartmentSearchState {
  List<Staff> get staffs => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Staff>>> get failureOrSuccess =>
      throw _privateConstructorUsedError;
  bool get isFirstFetch => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DepartmentSearchStateCopyWith<DepartmentSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentSearchStateCopyWith<$Res> {
  factory $DepartmentSearchStateCopyWith(DepartmentSearchState value,
          $Res Function(DepartmentSearchState) then) =
      _$DepartmentSearchStateCopyWithImpl<$Res, DepartmentSearchState>;
  @useResult
  $Res call(
      {List<Staff> staffs,
      Option<Either<MainFailure, List<Staff>>> failureOrSuccess,
      bool isFirstFetch,
      bool isLoading,
      bool hasNext});
}

/// @nodoc
class _$DepartmentSearchStateCopyWithImpl<$Res,
        $Val extends DepartmentSearchState>
    implements $DepartmentSearchStateCopyWith<$Res> {
  _$DepartmentSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffs = null,
    Object? failureOrSuccess = null,
    Object? isFirstFetch = null,
    Object? isLoading = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      staffs: null == staffs
          ? _value.staffs
          : staffs // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Staff>>>,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DepartmentSearchStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Staff> staffs,
      Option<Either<MainFailure, List<Staff>>> failureOrSuccess,
      bool isFirstFetch,
      bool isLoading,
      bool hasNext});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DepartmentSearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffs = null,
    Object? failureOrSuccess = null,
    Object? isFirstFetch = null,
    Object? isLoading = null,
    Object? hasNext = null,
  }) {
    return _then(_$InitialImpl(
      staffs: null == staffs
          ? _value._staffs
          : staffs // ignore: cast_nullable_to_non_nullable
              as List<Staff>,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Staff>>>,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<Staff> staffs,
      required this.failureOrSuccess,
      required this.isFirstFetch,
      required this.isLoading,
      required this.hasNext})
      : _staffs = staffs;

  final List<Staff> _staffs;
  @override
  List<Staff> get staffs {
    if (_staffs is EqualUnmodifiableListView) return _staffs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffs);
  }

  @override
  final Option<Either<MainFailure, List<Staff>>> failureOrSuccess;
  @override
  final bool isFirstFetch;
  @override
  final bool isLoading;
  @override
  final bool hasNext;

  @override
  String toString() {
    return 'DepartmentSearchState(staffs: $staffs, failureOrSuccess: $failureOrSuccess, isFirstFetch: $isFirstFetch, isLoading: $isLoading, hasNext: $hasNext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._staffs, _staffs) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_staffs),
      failureOrSuccess,
      isFirstFetch,
      isLoading,
      hasNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements DepartmentSearchState {
  const factory _Initial(
      {required final List<Staff> staffs,
      required final Option<Either<MainFailure, List<Staff>>> failureOrSuccess,
      required final bool isFirstFetch,
      required final bool isLoading,
      required final bool hasNext}) = _$InitialImpl;

  @override
  List<Staff> get staffs;
  @override
  Option<Either<MainFailure, List<Staff>>> get failureOrSuccess;
  @override
  bool get isFirstFetch;
  @override
  bool get isLoading;
  @override
  bool get hasNext;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
