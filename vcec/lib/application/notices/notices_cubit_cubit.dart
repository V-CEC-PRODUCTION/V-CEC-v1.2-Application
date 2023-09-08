import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/notices/notice_model/notices_result.dart';
import 'package:vcec/domain/notices/notices_service.dart';

import '../../domain/failure/main_failure.dart';
part 'notices_cubit_state.dart';
part 'notices_cubit_cubit.freezed.dart';

@injectable
class NoticesCubit extends Cubit<NoticesState> {
  final NoticesService _noticesService;
  NoticesCubit(this._noticesService) : super(NoticesState.initial());
  getNotices({required NoticeType type}) async {
    final result = await _noticesService.getnotices(type: type);
    if (type == NoticeType.cec) {
      result.fold(
        (l) => emit(state.copyWith(
          cecfailureOrSuccess: some(left(l)),
        )),
        (r) => emit(state.copyWith(
          cecfailureOrSuccess: some(right(r)),
        )),
      );
    } else {
      result.fold(
        (l) => emit(state.copyWith(
          ktufailureOrSuccess: some(left(l)),
        )),
        (r) => emit(state.copyWith(
          ktufailureOrSuccess: some(right(r)),
        )),
      );
    }
  }
}
