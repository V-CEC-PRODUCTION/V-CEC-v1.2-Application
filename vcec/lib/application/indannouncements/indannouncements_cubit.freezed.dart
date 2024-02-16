// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indannouncements_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IndAnnouncementsState {
  IndAnnouncementsModel? get indAnnouncements =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, IndAnnouncementsModel>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, bool>> get isFailureOrSuccessForLike =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndAnnouncementsStateCopyWith<IndAnnouncementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndAnnouncementsStateCopyWith<$Res> {
  factory $IndAnnouncementsStateCopyWith(IndAnnouncementsState value,
          $Res Function(IndAnnouncementsState) then) =
      _$IndAnnouncementsStateCopyWithImpl<$Res, IndAnnouncementsState>;
  @useResult
  $Res call(
      {IndAnnouncementsModel? indAnnouncements,
      bool isLoading,
      Option<Either<MainFailure, IndAnnouncementsModel>> isFailureOrSuccess,
      Option<Either<MainFailure, bool>> isFailureOrSuccessForLike});
}

/// @nodoc
class _$IndAnnouncementsStateCopyWithImpl<$Res,
        $Val extends IndAnnouncementsState>
    implements $IndAnnouncementsStateCopyWith<$Res> {
  _$IndAnnouncementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indAnnouncements = freezed,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isFailureOrSuccessForLike = null,
  }) {
    return _then(_value.copyWith(
      indAnnouncements: freezed == indAnnouncements
          ? _value.indAnnouncements
          : indAnnouncements // ignore: cast_nullable_to_non_nullable
              as IndAnnouncementsModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, IndAnnouncementsModel>>,
      isFailureOrSuccessForLike: null == isFailureOrSuccessForLike
          ? _value.isFailureOrSuccessForLike
          : isFailureOrSuccessForLike // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndEventsStateImplCopyWith<$Res>
    implements $IndAnnouncementsStateCopyWith<$Res> {
  factory _$$IndEventsStateImplCopyWith(_$IndEventsStateImpl value,
          $Res Function(_$IndEventsStateImpl) then) =
      __$$IndEventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IndAnnouncementsModel? indAnnouncements,
      bool isLoading,
      Option<Either<MainFailure, IndAnnouncementsModel>> isFailureOrSuccess,
      Option<Either<MainFailure, bool>> isFailureOrSuccessForLike});
}

/// @nodoc
class __$$IndEventsStateImplCopyWithImpl<$Res>
    extends _$IndAnnouncementsStateCopyWithImpl<$Res, _$IndEventsStateImpl>
    implements _$$IndEventsStateImplCopyWith<$Res> {
  __$$IndEventsStateImplCopyWithImpl(
      _$IndEventsStateImpl _value, $Res Function(_$IndEventsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indAnnouncements = freezed,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
    Object? isFailureOrSuccessForLike = null,
  }) {
    return _then(_$IndEventsStateImpl(
      indAnnouncements: freezed == indAnnouncements
          ? _value.indAnnouncements
          : indAnnouncements // ignore: cast_nullable_to_non_nullable
              as IndAnnouncementsModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, IndAnnouncementsModel>>,
      isFailureOrSuccessForLike: null == isFailureOrSuccessForLike
          ? _value.isFailureOrSuccessForLike
          : isFailureOrSuccessForLike // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, bool>>,
    ));
  }
}

/// @nodoc

class _$IndEventsStateImpl implements _IndEventsState {
  const _$IndEventsStateImpl(
      {required this.indAnnouncements,
      required this.isLoading,
      required this.isFailureOrSuccess,
      required this.isFailureOrSuccessForLike});

  @override
  final IndAnnouncementsModel? indAnnouncements;
  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, IndAnnouncementsModel>> isFailureOrSuccess;
  @override
  final Option<Either<MainFailure, bool>> isFailureOrSuccessForLike;

  @override
  String toString() {
    return 'IndAnnouncementsState(indAnnouncements: $indAnnouncements, isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess, isFailureOrSuccessForLike: $isFailureOrSuccessForLike)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndEventsStateImpl &&
            (identical(other.indAnnouncements, indAnnouncements) ||
                other.indAnnouncements == indAnnouncements) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess) &&
            (identical(other.isFailureOrSuccessForLike,
                    isFailureOrSuccessForLike) ||
                other.isFailureOrSuccessForLike == isFailureOrSuccessForLike));
  }

  @override
  int get hashCode => Object.hash(runtimeType, indAnnouncements, isLoading,
      isFailureOrSuccess, isFailureOrSuccessForLike);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndEventsStateImplCopyWith<_$IndEventsStateImpl> get copyWith =>
      __$$IndEventsStateImplCopyWithImpl<_$IndEventsStateImpl>(
          this, _$identity);
}

abstract class _IndEventsState implements IndAnnouncementsState {
  const factory _IndEventsState(
      {required final IndAnnouncementsModel? indAnnouncements,
      required final bool isLoading,
      required final Option<Either<MainFailure, IndAnnouncementsModel>>
          isFailureOrSuccess,
      required final Option<Either<MainFailure, bool>>
          isFailureOrSuccessForLike}) = _$IndEventsStateImpl;

  @override
  IndAnnouncementsModel? get indAnnouncements;
  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, IndAnnouncementsModel>> get isFailureOrSuccess;
  @override
  Option<Either<MainFailure, bool>> get isFailureOrSuccessForLike;
  @override
  @JsonKey(ignore: true)
  _$$IndEventsStateImplCopyWith<_$IndEventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
