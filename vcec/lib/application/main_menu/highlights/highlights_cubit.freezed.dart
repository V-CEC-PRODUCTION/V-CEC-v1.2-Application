// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlights_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HighlightsState {
  HighlightsModel? get highlights => throw _privateConstructorUsedError;
  Option<Either<MainFailure, HighlightsModel>> get highlightsSuccessOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HighlightsStateCopyWith<HighlightsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightsStateCopyWith<$Res> {
  factory $HighlightsStateCopyWith(
          HighlightsState value, $Res Function(HighlightsState) then) =
      _$HighlightsStateCopyWithImpl<$Res, HighlightsState>;
  @useResult
  $Res call(
      {HighlightsModel? highlights,
      Option<Either<MainFailure, HighlightsModel>> highlightsSuccessOrFailure});
}

/// @nodoc
class _$HighlightsStateCopyWithImpl<$Res, $Val extends HighlightsState>
    implements $HighlightsStateCopyWith<$Res> {
  _$HighlightsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlights = freezed,
    Object? highlightsSuccessOrFailure = null,
  }) {
    return _then(_value.copyWith(
      highlights: freezed == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as HighlightsModel?,
      highlightsSuccessOrFailure: null == highlightsSuccessOrFailure
          ? _value.highlightsSuccessOrFailure
          : highlightsSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, HighlightsModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HighlightsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HighlightsModel? highlights,
      Option<Either<MainFailure, HighlightsModel>> highlightsSuccessOrFailure});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HighlightsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? highlights = freezed,
    Object? highlightsSuccessOrFailure = null,
  }) {
    return _then(_$InitialImpl(
      highlights: freezed == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as HighlightsModel?,
      highlightsSuccessOrFailure: null == highlightsSuccessOrFailure
          ? _value.highlightsSuccessOrFailure
          : highlightsSuccessOrFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, HighlightsModel>>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.highlights, required this.highlightsSuccessOrFailure});

  @override
  final HighlightsModel? highlights;
  @override
  final Option<Either<MainFailure, HighlightsModel>> highlightsSuccessOrFailure;

  @override
  String toString() {
    return 'HighlightsState(highlights: $highlights, highlightsSuccessOrFailure: $highlightsSuccessOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.highlights, highlights) ||
                other.highlights == highlights) &&
            (identical(other.highlightsSuccessOrFailure,
                    highlightsSuccessOrFailure) ||
                other.highlightsSuccessOrFailure ==
                    highlightsSuccessOrFailure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, highlights, highlightsSuccessOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements HighlightsState {
  const factory _Initial(
      {required final HighlightsModel? highlights,
      required final Option<Either<MainFailure, HighlightsModel>>
          highlightsSuccessOrFailure}) = _$InitialImpl;

  @override
  HighlightsModel? get highlights;
  @override
  Option<Either<MainFailure, HighlightsModel>> get highlightsSuccessOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
