// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adduser_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddUserState {
  bool get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddUserStateCopyWith<AddUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserStateCopyWith<$Res> {
  factory $AddUserStateCopyWith(
          AddUserState value, $Res Function(AddUserState) then) =
      _$AddUserStateCopyWithImpl<$Res, AddUserState>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class _$AddUserStateCopyWithImpl<$Res, $Val extends AddUserState>
    implements $AddUserStateCopyWith<$Res> {
  _$AddUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddUserStateCopyWith<$Res>
    implements $AddUserStateCopyWith<$Res> {
  factory _$$_AddUserStateCopyWith(
          _$_AddUserState value, $Res Function(_$_AddUserState) then) =
      __$$_AddUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$_AddUserStateCopyWithImpl<$Res>
    extends _$AddUserStateCopyWithImpl<$Res, _$_AddUserState>
    implements _$$_AddUserStateCopyWith<$Res> {
  __$$_AddUserStateCopyWithImpl(
      _$_AddUserState _value, $Res Function(_$_AddUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_AddUserState(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddUserState implements _AddUserState {
  const _$_AddUserState({required this.value});

  @override
  final bool value;

  @override
  String toString() {
    return 'AddUserState(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddUserState &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddUserStateCopyWith<_$_AddUserState> get copyWith =>
      __$$_AddUserStateCopyWithImpl<_$_AddUserState>(this, _$identity);
}

abstract class _AddUserState implements AddUserState {
  const factory _AddUserState({required final bool value}) = _$_AddUserState;

  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$_AddUserStateCopyWith<_$_AddUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
