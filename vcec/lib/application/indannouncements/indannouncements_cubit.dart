import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/Announcements/announcements_likes_service.dart';
import 'package:vcec/domain/events/announcements/announcements_views_service.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_model/ind_announcements_model.dart';
import 'package:vcec/domain/events/announcements/ind_announcements_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'indannouncements_cubit.freezed.dart';
part 'indannouncements_state.dart';

@injectable
class IndAnnouncementsCubit extends Cubit<IndAnnouncementsState> {
  IndAnnouncementsCubit(this._indAnnouncementsService, this._viewsService, this._likesService)
      : super(IndAnnouncementsState.initial());
  final IndAnnouncementsService _indAnnouncementsService;
  final AnnouncementsLikesService _likesService;
  final AnnouncementsViewsService _viewsService;
  void getIndAnnouncements({required int id}) async {
    final result1 = await _viewsService.postView(id: id);
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _indAnnouncementsService.getIndAnnouncements(id: id);
    result1.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
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
    });
  }

  void postLike({required int id, required String val}) async {
    final result = await _likesService.postLike(id: id, val: val);
    result.fold(
      (l) => emit(state.copyWith(
            isFailureOrSuccess: some(left(l)),
          )),
      (r) {
        emit(state.copyWith(
          isFailureOrSuccessForLike: some(right(r)),
        ));
      },
    );
  }
}
