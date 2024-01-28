part of 'timetable_cubit.dart';

@freezed
class TimetableState with _$TimetableState {
  const factory TimetableState({
    required TimeTableModel? timetable,
    required Option<Either<MainFailure, TimeTableModel>>
        timetableFailureOrSuccess,
  }) = _Initial;
  factory TimetableState.initial() {
    return _Initial(
      timetable: null,
      timetableFailureOrSuccess: none(),
    );
  }
}
