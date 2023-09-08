part of 'notices_cubit_cubit.dart';

@freezed
class NoticesState with _$NoticesState {
  const factory NoticesState({
    required Option<Either<MainFailure, List<NoticesResult>>>
        cecfailureOrSuccess,
    required Option<Either<MainFailure, List<NoticesResult>>>
        ktufailureOrSuccess,
  }) = _Initial;
  factory NoticesState.initial() {
    return _Initial(
      cecfailureOrSuccess: none(),
      ktufailureOrSuccess: none(),
    );
  }
}
