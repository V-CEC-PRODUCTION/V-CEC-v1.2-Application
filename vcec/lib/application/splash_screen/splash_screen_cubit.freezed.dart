// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SplashScreenState {
  String get page => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashScreenStateCopyWith<SplashScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashScreenStateCopyWith<$Res> {
  factory $SplashScreenStateCopyWith(
          SplashScreenState value, $Res Function(SplashScreenState) then) =
      _$SplashScreenStateCopyWithImpl<$Res, SplashScreenState>;
  @useResult
  $Res call({String page, String msg});
}

/// @nodoc
class _$SplashScreenStateCopyWithImpl<$Res, $Val extends SplashScreenState>
    implements $SplashScreenStateCopyWith<$Res> {
  _$SplashScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashScreenStateImplCopyWith<$Res>
    implements $SplashScreenStateCopyWith<$Res> {
  factory _$$SplashScreenStateImplCopyWith(_$SplashScreenStateImpl value,
          $Res Function(_$SplashScreenStateImpl) then) =
      __$$SplashScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String page, String msg});
}

/// @nodoc
class __$$SplashScreenStateImplCopyWithImpl<$Res>
    extends _$SplashScreenStateCopyWithImpl<$Res, _$SplashScreenStateImpl>
    implements _$$SplashScreenStateImplCopyWith<$Res> {
  __$$SplashScreenStateImplCopyWithImpl(_$SplashScreenStateImpl _value,
      $Res Function(_$SplashScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? msg = null,
  }) {
    return _then(_$SplashScreenStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SplashScreenStateImpl implements _SplashScreenState {
  const _$SplashScreenStateImpl({required this.page, required this.msg});

  @override
  final String page;
  @override
  final String msg;

  @override
  String toString() {
    return 'SplashScreenState(page: $page, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashScreenStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashScreenStateImplCopyWith<_$SplashScreenStateImpl> get copyWith =>
      __$$SplashScreenStateImplCopyWithImpl<_$SplashScreenStateImpl>(
          this, _$identity);
}

abstract class _SplashScreenState implements SplashScreenState {
  const factory _SplashScreenState(
      {required final String page,
      required final String msg}) = _$SplashScreenStateImpl;

  @override
  String get page;
  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$SplashScreenStateImplCopyWith<_$SplashScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
