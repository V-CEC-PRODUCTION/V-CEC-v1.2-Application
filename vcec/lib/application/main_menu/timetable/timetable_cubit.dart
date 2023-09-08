import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_model/timetable_model.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart';
import 'package:injectable/injectable.dart';
part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

@injectable
class TimetableCubit extends Cubit<TimetableState> {
  final TimeTableService timetableService;
  TimetableCubit(this.timetableService) : super(TimetableState.initial());
  void getTimetable() async {
    await timetableService.getTimetable().then((value) {
      value.fold(
        (failure) => emit(
          state.copyWith(
            timetable: null,
            timetableFailureOrSuccess: Some(Left(failure)),
          ),
        ),
        (success) => emit(
          state.copyWith(
            timetable: success,
            timetableFailureOrSuccess: Some(Right(success)),
          ),
        ),
      );
    });
  }
}
