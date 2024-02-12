import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_model/ind_announcements_model.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'indannouncements_cubit.freezed.dart';
part 'indannouncements_state.dart';

@injectable
class IndAnnouncementsCubit extends Cubit<IndAnnouncementsState> {
  IndAnnouncementsCubit(this._indAnnouncementsService) : super(IndAnnouncementsState.initial());
  final IndAnnouncementsService _indAnnouncementsService;

  void getIndAnnouncements({required int id}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _indAnnouncementsService.getIndAnnouncements(id: id);
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        indAnnouncements: r,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }
}
