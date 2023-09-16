// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showerrormessages => throw _privateConstructorUsedError;
  Option<Either<MainFailure, Unit>> get authfailureorsuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleStateCopyWith<GoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleStateCopyWith<$Res> {
  factory $GoogleStateCopyWith(
          GoogleState value, $Res Function(GoogleState) then) =
      _$GoogleStateCopyWithImpl<$Res, GoogleState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showerrormessages,
      Option<Either<MainFailure, Unit>> authfailureorsuccess});
}

/// @nodoc
class _$GoogleStateCopyWithImpl<$Res, $Val extends GoogleState>
    implements $GoogleStateCopyWith<$Res> {
  _$GoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showerrormessages = null,
    Object? authfailureorsuccess = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showerrormessages: null == showerrormessages
          ? _value.showerrormessages
          : showerrormessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authfailureorsuccess: null == authfailureorsuccess
          ? _value.authfailureorsuccess
          : authfailureorsuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleStateCopyWith<$Res>
    implements $GoogleStateCopyWith<$Res> {
  factory _$$_GoogleStateCopyWith(
          _$_GoogleState value, $Res Function(_$_GoogleState) then) =
      __$$_GoogleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showerrormessages,
      Option<Either<MainFailure, Unit>> authfailureorsuccess});
}

/// @nodoc
class __$$_GoogleStateCopyWithImpl<$Res>
    extends _$GoogleStateCopyWithImpl<$Res, _$_GoogleState>
    implements _$$_GoogleStateCopyWith<$Res> {
  __$$_GoogleStateCopyWithImpl(
      _$_GoogleState _value, $Res Function(_$_GoogleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showerrormessages = null,
    Object? authfailureorsuccess = null,
  }) {
    return _then(_$_GoogleState(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showerrormessages: null == showerrormessages
          ? _value.showerrormessages
          : showerrormessages // ignore: cast_nullable_to_non_nullable
              as bool,
      authfailureorsuccess: null == authfailureorsuccess
          ? _value.authfailureorsuccess
          : authfailureorsuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_GoogleState implements _GoogleState {
  const _$_GoogleState(
      {required this.isSubmitting,
      required this.showerrormessages,
      required this.authfailureorsuccess});

  @override
  final bool isSubmitting;
  @override
  final bool showerrormessages;
  @override
  final Option<Either<MainFailure, Unit>> authfailureorsuccess;

  @override
  String toString() {
    return 'GoogleState(isSubmitting: $isSubmitting, showerrormessages: $showerrormessages, authfailureorsuccess: $authfailureorsuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleState &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showerrormessages, showerrormessages) ||
                other.showerrormessages == showerrormessages) &&
            (identical(other.authfailureorsuccess, authfailureorsuccess) ||
                other.authfailureorsuccess == authfailureorsuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSubmitting, showerrormessages, authfailureorsuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleStateCopyWith<_$_GoogleState> get copyWith =>
      __$$_GoogleStateCopyWithImpl<_$_GoogleState>(this, _$identity);
}

abstract class _GoogleState implements GoogleState {
  const factory _GoogleState(
      {required final bool isSubmitting,
      required final bool showerrormessages,
      required final Option<Either<MainFailure, Unit>>
          authfailureorsuccess}) = _$_GoogleState;

  @override
  bool get isSubmitting;
  @override
  bool get showerrormessages;
  @override
  Option<Either<MainFailure, Unit>> get authfailureorsuccess;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleStateCopyWith<_$_GoogleState> get copyWith =>
      throw _privateConstructorUsedError;
}
