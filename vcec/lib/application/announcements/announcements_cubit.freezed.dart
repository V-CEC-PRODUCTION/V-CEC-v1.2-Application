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
  List<Annoucement> get announcements => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Annoucement>>> get isFailureOrSuccess =>
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
      {List<Annoucement> announcements,
      bool isLoading,
      Option<Either<MainFailure, List<Annoucement>>> isFailureOrSuccess});
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
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      announcements: null == announcements
          ? _value.announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Annoucement>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Annoucement>>>,
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
      {List<Annoucement> announcements,
      bool isLoading,
      Option<Either<MainFailure, List<Annoucement>>> isFailureOrSuccess});
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
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$AnnouncementStateImpl(
      announcements: null == announcements
          ? _value._announcements
          : announcements // ignore: cast_nullable_to_non_nullable
              as List<Annoucement>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Annoucement>>>,
    ));
  }
}

/// @nodoc

class _$AnnouncementStateImpl implements _AnnouncementState {
  const _$AnnouncementStateImpl(
      {required final List<Annoucement> announcements,
      required this.isLoading,
      required this.isFailureOrSuccess})
      : _announcements = announcements;

  final List<Annoucement> _announcements;
  @override
  List<Annoucement> get announcements {
    if (_announcements is EqualUnmodifiableListView) return _announcements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcements);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, List<Annoucement>>> isFailureOrSuccess;

  @override
  String toString() {
    return 'AnnouncementState(announcements: $announcements, isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
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
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_announcements),
      isLoading,
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
      {required final List<Annoucement> announcements,
      required final bool isLoading,
      required final Option<Either<MainFailure, List<Annoucement>>>
          isFailureOrSuccess}) = _$AnnouncementStateImpl;

  @override
  List<Annoucement> get announcements;
  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, List<Annoucement>>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$AnnouncementStateImplCopyWith<_$AnnouncementStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
