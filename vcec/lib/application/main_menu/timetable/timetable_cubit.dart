import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/time_table/time_table.dart';
import 'package:vcec/domain/mainmenu/timetable/timetable_service.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/mainmenu/timetable/user_role_service.dart';
part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

@injectable
class TimetableCubit extends Cubit<TimetableState> {
  final TimeTableService timetableService;
  final RoleService roleService;
  TimetableCubit(
    this.timetableService,
    this.roleService,
  ) : super(TimetableState.initial());
  void getTimetable() async {
    await roleService.getRole().then((value) => value.fold((l) {}, (r) async {
          if (r.role == 'student') {
            AuthTokenManager.instance.setUserRole(UserRole.student);
          } else {
            AuthTokenManager.instance.setUserRole(UserRole.guest);
          }
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
        }));
  }
}
