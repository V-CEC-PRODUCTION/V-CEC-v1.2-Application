// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forums_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForumsState {
  List<AllForum> get forums => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<AllForum>>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForumsStateCopyWith<ForumsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForumsStateCopyWith<$Res> {
  factory $ForumsStateCopyWith(
          ForumsState value, $Res Function(ForumsState) then) =
      _$ForumsStateCopyWithImpl<$Res, ForumsState>;
  @useResult
  $Res call(
      {List<AllForum> forums,
      bool isLoading,
      Option<Either<MainFailure, List<AllForum>>> isFailureOrSuccess});
}

/// @nodoc
class _$ForumsStateCopyWithImpl<$Res, $Val extends ForumsState>
    implements $ForumsStateCopyWith<$Res> {
  _$ForumsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forums = null,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      forums: null == forums
          ? _value.forums
          : forums // ignore: cast_nullable_to_non_nullable
              as List<AllForum>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<AllForum>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForumsStateImplCopyWith<$Res>
    implements $ForumsStateCopyWith<$Res> {
  factory _$$ForumsStateImplCopyWith(
          _$ForumsStateImpl value, $Res Function(_$ForumsStateImpl) then) =
      __$$ForumsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AllForum> forums,
      bool isLoading,
      Option<Either<MainFailure, List<AllForum>>> isFailureOrSuccess});
}

/// @nodoc
class __$$ForumsStateImplCopyWithImpl<$Res>
    extends _$ForumsStateCopyWithImpl<$Res, _$ForumsStateImpl>
    implements _$$ForumsStateImplCopyWith<$Res> {
  __$$ForumsStateImplCopyWithImpl(
      _$ForumsStateImpl _value, $Res Function(_$ForumsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forums = null,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$ForumsStateImpl(
      forums: null == forums
          ? _value._forums
          : forums // ignore: cast_nullable_to_non_nullable
              as List<AllForum>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<AllForum>>>,
    ));
  }
}

/// @nodoc

class _$ForumsStateImpl implements _ForumsState {
  const _$ForumsStateImpl(
      {required final List<AllForum> forums,
      required this.isLoading,
      required this.isFailureOrSuccess})
      : _forums = forums;

  final List<AllForum> _forums;
  @override
  List<AllForum> get forums {
    if (_forums is EqualUnmodifiableListView) return _forums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forums);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, List<AllForum>>> isFailureOrSuccess;

  @override
  String toString() {
    return 'ForumsState(forums: $forums, isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForumsStateImpl &&
            const DeepCollectionEquality().equals(other._forums, _forums) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_forums),
      isLoading,
      isFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForumsStateImplCopyWith<_$ForumsStateImpl> get copyWith =>
      __$$ForumsStateImplCopyWithImpl<_$ForumsStateImpl>(this, _$identity);
}

abstract class _ForumsState implements ForumsState {
  const factory _ForumsState(
      {required final List<AllForum> forums,
      required final bool isLoading,
      required final Option<Either<MainFailure, List<AllForum>>>
          isFailureOrSuccess}) = _$ForumsStateImpl;

  @override
  List<AllForum> get forums;
  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, List<AllForum>>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$ForumsStateImplCopyWith<_$ForumsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
