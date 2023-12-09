// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CarouselState {
  List<CarouselImage>? get carouselImages => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<CarouselImage>>>
      get carouselFailureOrSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarouselStateCopyWith<CarouselState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselStateCopyWith<$Res> {
  factory $CarouselStateCopyWith(
          CarouselState value, $Res Function(CarouselState) then) =
      _$CarouselStateCopyWithImpl<$Res, CarouselState>;
  @useResult
  $Res call(
      {List<CarouselImage>? carouselImages,
      Option<Either<MainFailure, List<CarouselImage>>>
          carouselFailureOrSuccess});
}

/// @nodoc
class _$CarouselStateCopyWithImpl<$Res, $Val extends CarouselState>
    implements $CarouselStateCopyWith<$Res> {
  _$CarouselStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carouselImages = freezed,
    Object? carouselFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      carouselImages: freezed == carouselImages
          ? _value.carouselImages
          : carouselImages // ignore: cast_nullable_to_non_nullable
              as List<CarouselImage>?,
      carouselFailureOrSuccess: null == carouselFailureOrSuccess
          ? _value.carouselFailureOrSuccess
          : carouselFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<CarouselImage>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarouselStateImplCopyWith<$Res>
    implements $CarouselStateCopyWith<$Res> {
  factory _$$CarouselStateImplCopyWith(
          _$CarouselStateImpl value, $Res Function(_$CarouselStateImpl) then) =
      __$$CarouselStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CarouselImage>? carouselImages,
      Option<Either<MainFailure, List<CarouselImage>>>
          carouselFailureOrSuccess});
}

/// @nodoc
class __$$CarouselStateImplCopyWithImpl<$Res>
    extends _$CarouselStateCopyWithImpl<$Res, _$CarouselStateImpl>
    implements _$$CarouselStateImplCopyWith<$Res> {
  __$$CarouselStateImplCopyWithImpl(
      _$CarouselStateImpl _value, $Res Function(_$CarouselStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carouselImages = freezed,
    Object? carouselFailureOrSuccess = null,
  }) {
    return _then(_$CarouselStateImpl(
      carouselImages: freezed == carouselImages
          ? _value._carouselImages
          : carouselImages // ignore: cast_nullable_to_non_nullable
              as List<CarouselImage>?,
      carouselFailureOrSuccess: null == carouselFailureOrSuccess
          ? _value.carouselFailureOrSuccess
          : carouselFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<CarouselImage>>>,
    ));
  }
}

/// @nodoc

class _$CarouselStateImpl implements _CarouselState {
  const _$CarouselStateImpl(
      {required final List<CarouselImage>? carouselImages,
      required this.carouselFailureOrSuccess})
      : _carouselImages = carouselImages;

  final List<CarouselImage>? _carouselImages;
  @override
  List<CarouselImage>? get carouselImages {
    final value = _carouselImages;
    if (value == null) return null;
    if (_carouselImages is EqualUnmodifiableListView) return _carouselImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<CarouselImage>>>
      carouselFailureOrSuccess;

  @override
  String toString() {
    return 'CarouselState(carouselImages: $carouselImages, carouselFailureOrSuccess: $carouselFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselStateImpl &&
            const DeepCollectionEquality()
                .equals(other._carouselImages, _carouselImages) &&
            (identical(
                    other.carouselFailureOrSuccess, carouselFailureOrSuccess) ||
                other.carouselFailureOrSuccess == carouselFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_carouselImages),
      carouselFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselStateImplCopyWith<_$CarouselStateImpl> get copyWith =>
      __$$CarouselStateImplCopyWithImpl<_$CarouselStateImpl>(this, _$identity);
}

abstract class _CarouselState implements CarouselState {
  const factory _CarouselState(
      {required final List<CarouselImage>? carouselImages,
      required final Option<Either<MainFailure, List<CarouselImage>>>
          carouselFailureOrSuccess}) = _$CarouselStateImpl;

  @override
  List<CarouselImage>? get carouselImages;
  @override
  Option<Either<MainFailure, List<CarouselImage>>> get carouselFailureOrSuccess;
  @override
  @JsonKey(ignore: true)
  _$$CarouselStateImplCopyWith<_$CarouselStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
