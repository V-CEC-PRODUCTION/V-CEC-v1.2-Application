// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventsState {
  Map<String, List<EventModel>> get events =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<EventModel>>> get isFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsStateCopyWith<EventsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsStateCopyWith<$Res> {
  factory $EventsStateCopyWith(
          EventsState value, $Res Function(EventsState) then) =
      _$EventsStateCopyWithImpl<$Res, EventsState>;
  @useResult
  $Res call(
      {Map<String, List<EventModel>> events,
      bool isLoading,
      Option<Either<MainFailure, List<EventModel>>> isFailureOrSuccess});
}

/// @nodoc
class _$EventsStateCopyWithImpl<$Res, $Val extends EventsState>
    implements $EventsStateCopyWith<$Res> {
  _$EventsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as Map<String, List<EventModel>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<EventModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventsStateImplCopyWith<$Res>
    implements $EventsStateCopyWith<$Res> {
  factory _$$EventsStateImplCopyWith(
          _$EventsStateImpl value, $Res Function(_$EventsStateImpl) then) =
      __$$EventsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<EventModel>> events,
      bool isLoading,
      Option<Either<MainFailure, List<EventModel>>> isFailureOrSuccess});
}

/// @nodoc
class __$$EventsStateImplCopyWithImpl<$Res>
    extends _$EventsStateCopyWithImpl<$Res, _$EventsStateImpl>
    implements _$$EventsStateImplCopyWith<$Res> {
  __$$EventsStateImplCopyWithImpl(
      _$EventsStateImpl _value, $Res Function(_$EventsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isFailureOrSuccess = null,
  }) {
    return _then(_$EventsStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as Map<String, List<EventModel>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailureOrSuccess: null == isFailureOrSuccess
          ? _value.isFailureOrSuccess
          : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<EventModel>>>,
    ));
  }
}

/// @nodoc

class _$EventsStateImpl implements _EventsState {
  const _$EventsStateImpl(
      {required final Map<String, List<EventModel>> events,
      required this.isLoading,
      required this.isFailureOrSuccess})
      : _events = events;

  final Map<String, List<EventModel>> _events;
  @override
  Map<String, List<EventModel>> get events {
    if (_events is EqualUnmodifiableMapView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_events);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailure, List<EventModel>>> isFailureOrSuccess;

  @override
  String toString() {
    return 'EventsState(events: $events, isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailureOrSuccess, isFailureOrSuccess) ||
                other.isFailureOrSuccess == isFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      isLoading,
      isFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsStateImplCopyWith<_$EventsStateImpl> get copyWith =>
      __$$EventsStateImplCopyWithImpl<_$EventsStateImpl>(this, _$identity);
}

abstract class _EventsState implements EventsState {
  const factory _EventsState(
      {required final Map<String, List<EventModel>> events,
      required final bool isLoading,
      required final Option<Either<MainFailure, List<EventModel>>>
          isFailureOrSuccess}) = _$EventsStateImpl;

  @override
  Map<String, List<EventModel>> get events;
  @override
  bool get isLoading;
  @override
  Option<Either<MainFailure, List<EventModel>>> get isFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$EventsStateImplCopyWith<_$EventsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
