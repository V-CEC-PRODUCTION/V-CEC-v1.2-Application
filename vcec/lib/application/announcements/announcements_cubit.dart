import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/Announcements/announcement_model/annoucement.dart';
import 'package:vcec/domain/Announcements/announcements_service.dart';
import '../../domain/failure/main_failure.dart';
part 'announcements_state.dart';
part 'announcements_cubit.freezed.dart';

@injectable
class AnnouncementCubit extends Cubit<AnnouncementState> {
  final AnnouncementService _announcementService;
  AnnouncementCubit(this._announcementService)
      : super(AnnouncementState.initial());

  void getAnnoucements() async {
    emit(state.copyWith(
      announcements: [],
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _announcementService.getAnnouncements();
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        announcements: r,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }
}
