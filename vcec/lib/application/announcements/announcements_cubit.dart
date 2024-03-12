import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/Announcements/announcement_model/announcement.dart';
import 'package:vcec/domain/Announcements/announcements_service.dart';
import '../../domain/failure/main_failure.dart';
part 'announcements_state.dart';
part 'announcements_cubit.freezed.dart';

@injectable
class AnnouncementCubit extends Cubit<AnnouncementState> {
  final AnnouncementService _announcementService;
  AnnouncementCubit(this._announcementService)
      : super(AnnouncementState.initial());
  int pageNum = 1;
  void getAnnoucements({required String forum}) async {
    emit(state.copyWith(
      announcements: [],
      isLoading: true,
      isFailureOrSuccess: none(),
      isFirstFetch: pageNum == 1,
    ));
    final result = await _announcementService.getAnnouncements(
        forum: forum, pageNum: pageNum, call: true);
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      List<Announcement> updatedEvents = List.from(state.announcements);
      updatedEvents.addAll(r.announcements!);
      emit(state.copyWith(
        isLoading: false,
        announcements: updatedEvents,
        isFailureOrSuccess: some(right(updatedEvents)),
        hasNext: r.hasNext!,
      ));

      pageNum++;
    });
  }

  void getAnnoucements1({required String forum}) async {
    emit(state.copyWith(
      announcements: [],
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _announcementService.getAnnouncements(
        forum: forum, pageNum: pageNum, call: false);
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        announcements: r.announcements!,
        isFailureOrSuccess: some(right(r.announcements!)),
      ));
    });
  }
}
