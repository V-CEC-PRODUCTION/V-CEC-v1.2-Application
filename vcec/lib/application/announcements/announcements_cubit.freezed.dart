// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcements_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementState {
  List<Announcement> get announcements => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFirstFetch => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Announcement>>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementStateCopyWith<AnnouncementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementStateCopyWith<$Res> {
  factory $AnnouncementStateCopyWith(
          AnnouncementState value, $Res Function(AnnouncementState) then) =
      _$AnnouncementStateCopyWithImpl<$Res, AnnouncementState>;
  @useResult
  $Res call(
      {List<Announcement> announcements,
      bool isLoading,
      bool isFirstFetch,
      bool hasNext,
      Option<Either<MainFailure, List<Announcement>>> isFailureOrSuccess});
}

/// @nodoc
class _$AnnouncementStateCopyWithImpl<$Res, $Val extends AnnouncementState>
    implements $AnnouncementStateCopyWith<$Res> {
  _$AnnouncementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcements = null,
    Object? isLoading = null,
    Object? isFirstFetch = null,
    Object? hasNext = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Announcement>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Announcement>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnouncementStateImplCopyWith<$Res>
    implements $AnnouncementStateCopyWith<$Res> {
  factory _$$AnnouncementStateImplCopyWith(_$AnnouncementStateImpl value,
          $Res Function(_$AnnouncementStateImpl) then) =
      __$$AnnouncementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Announcement> announcements,
      bool isLoading,
      bool isFirstFetch,
      bool hasNext,
      Option<Either<MainFailure, List<Announcement>>> isFailureOrSuccess});
}

/// @nodoc
class __$$AnnouncementStateImplCopyWithImpl<$Res>
    extends _$AnnouncementStateCopyWithImpl<$Res, _$AnnouncementStateImpl>
    implements _$$AnnouncementStateImplCopyWith<$Res> {
  __$$AnnouncementStateImplCopyWithImpl(_$AnnouncementStateImpl _value,
      $Res Function(_$AnnouncementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announcements = null,
    Object? isLoading = null,
    Object? isFirstFetch = null,
    Object? hasNext = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$AnnouncementStateImpl(
      announcements: null == announcements
          ? _value._announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Announcement>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstFetch: null == isFirstFetch
          ? _value.isFirstFetch
          : isFirstFetch // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Announcement>>>,
    ));
  }
}

/// @nodoc

class _$AnnouncementStateImpl implements _AnnouncementState {
  const _$AnnouncementStateImpl(
      {required final List<Announcement> announcements,
      required this.isLoading,
      required this.isFirstFetch,
      required this.hasNext,
      required this.isFailureOrSuccess})
      : _announcements = announcements;

  final List<Announcement> _announcements;
  @override
  List<Announcement> get announcements {
    if (_announcements is EqualUnmodifiableListView) return _announcements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcements);
  }

  @override
  final bool isLoading;
  @override
  final bool isFirstFetch;
  @override
  final bool hasNext;
  @override
  final Option<Either<MainFailure, List<Announcement>>> isFailureOrSuccess;

  @override
  String toString() {
    return 'AnnouncementState(announcements: $announcements, isLoading: $isLoading, isFirstFetch: $isFirstFetch, hasNext: $hasNext, isFailureOrSuccess: $isFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnouncementStateImpl &&
            const DeepCollectionEquality()
                .equals(other._announcements, _announcements) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFirstFetch, isFirstFetch) ||
                other.isFirstFetch == isFirstFetch) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_announcements),
      isLoading,
      isFirstFetch,
      hasNext,
      isFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnouncementStateImplCopyWith<_$AnnouncementStateImpl> get copyWith =>
      __$$AnnouncementStateImplCopyWithImpl<_$AnnouncementStateImpl>(
          this, _$identity);
}

abstract class _AnnouncementState implements AnnouncementState {
  const factory _AnnouncementState(
      {required final List<Announcement> announcements,
      required final bool isLoading,
      required final bool isFirstFetch,
      required final bool hasNext,
      required final Option<Either<MainFailure, List<Announcement>>>
          isFailureOrSuccess}) = _$AnnouncementStateImpl;

  @override
  List<Announcement> get announcements;
  @override
  bool get isLoading;
  @override
  bool get isFirstFetch;
  @override
  bool get hasNext;
  @override
  Option<Either<MainFailure, List<Announcement>>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementStateImplCopyWith<_$AnnouncementStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
