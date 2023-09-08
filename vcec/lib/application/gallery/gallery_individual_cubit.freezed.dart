// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_individual_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryIndividualState {
  GalleryPressedModel? get galleryIndividual =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, GalleryPressedModel>> get failureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryIndividualStateCopyWith<GalleryIndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryIndividualStateCopyWith<$Res> {
  factory $GalleryIndividualStateCopyWith(GalleryIndividualState value,
          $Res Function(GalleryIndividualState) then) =
      _$GalleryIndividualStateCopyWithImpl<$Res, GalleryIndividualState>;
  @useResult
  $Res call(
      {GalleryPressedModel? galleryIndividual,
      Option<Either<MainFailure, GalleryPressedModel>> failureOrSuccess});
}

/// @nodoc
class _$GalleryIndividualStateCopyWithImpl<$Res,
        $Val extends GalleryIndividualState>
    implements $GalleryIndividualStateCopyWith<$Res> {
  _$GalleryIndividualStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryIndividual = freezed,
    Object? failureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      galleryIndividual: freezed == galleryIndividual
          ? _value.galleryIndividual
          : galleryIndividual // ignore: cast_nullable_to_non_nullable
              as GalleryPressedModel?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, GalleryPressedModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GalleryIndividualStateCopyWith<$Res>
    implements $GalleryIndividualStateCopyWith<$Res> {
  factory _$$_GalleryIndividualStateCopyWith(_$_GalleryIndividualState value,
          $Res Function(_$_GalleryIndividualState) then) =
      __$$_GalleryIndividualStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GalleryPressedModel? galleryIndividual,
      Option<Either<MainFailure, GalleryPressedModel>> failureOrSuccess});
}

/// @nodoc
class __$$_GalleryIndividualStateCopyWithImpl<$Res>
    extends _$GalleryIndividualStateCopyWithImpl<$Res,
        _$_GalleryIndividualState>
    implements _$$_GalleryIndividualStateCopyWith<$Res> {
  __$$_GalleryIndividualStateCopyWithImpl(_$_GalleryIndividualState _value,
      $Res Function(_$_GalleryIndividualState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryIndividual = freezed,
    Object? failureOrSuccess = null,
  }) {
    return _then(_$_GalleryIndividualState(
      galleryIndividual: freezed == galleryIndividual
          ? _value.galleryIndividual
          : galleryIndividual // ignore: cast_nullable_to_non_nullable
              as GalleryPressedModel?,
      failureOrSuccess: null == failureOrSuccess
          ? _value.failureOrSuccess
          : failureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, GalleryPressedModel>>,
    ));
  }
}

/// @nodoc

class _$_GalleryIndividualState implements _GalleryIndividualState {
  const _$_GalleryIndividualState(
      {required this.galleryIndividual, required this.failureOrSuccess});

  @override
  final GalleryPressedModel? galleryIndividual;
  @override
  final Option<Either<MainFailure, GalleryPressedModel>> failureOrSuccess;

  @override
  String toString() {
    return 'GalleryIndividualState(galleryIndividual: $galleryIndividual, failureOrSuccess: $failureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryIndividualState &&
            (identical(other.galleryIndividual, galleryIndividual) ||
                other.galleryIndividual == galleryIndividual) &&
            (identical(other.failureOrSuccess, failureOrSuccess) ||
                other.failureOrSuccess == failureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, galleryIndividual, failureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryIndividualStateCopyWith<_$_GalleryIndividualState> get copyWith =>
      __$$_GalleryIndividualStateCopyWithImpl<_$_GalleryIndividualState>(
          this, _$identity);
}

abstract class _GalleryIndividualState implements GalleryIndividualState {
  const factory _GalleryIndividualState(
      {required final GalleryPressedModel? galleryIndividual,
      required final Option<Either<MainFailure, GalleryPressedModel>>
          failureOrSuccess}) = _$_GalleryIndividualState;

  @override
  GalleryPressedModel? get galleryIndividual;
  @override
  Option<Either<MainFailure, GalleryPressedModel>> get failureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryIndividualStateCopyWith<_$_GalleryIndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}
