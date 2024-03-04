import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/model/evenets_register_service.dart';
import 'package:vcec/domain/events/model/events_views_service.dart';
import 'package:vcec/domain/events/model/evnts_like_service.dart';
import 'package:vcec/domain/events/model/ind_events_model/ind_events_model.dart';
import 'package:vcec/domain/events/model/ind_events_service.dart';
import 'package:vcec/domain/events/model/likes_model/img_likes_service.dart';
import 'package:vcec/domain/events/model/likes_model/likes_model/event_like.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'indeventscubit_cubit.freezed.dart';
part 'indeventscubit_state.dart';

@injectable
class IndEventsCubit extends Cubit<IndEventsState> {
  IndEventsCubit(this._indEventsService, this._viewsService, this._likesService,
      this._registerService, this._imgLikesService)
      : super(IndEventsState.initial());
  final IndEventsService _indEventsService;
  final ViewsService _viewsService;
  final RegisterService _registerService;
  final LikesService _likesService;
  final ImgLikesService _imgLikesService;

  void getIndEvents({required int id}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result1 = await _viewsService.postView(id: id);
    final result = await _indEventsService.getIndEvents(id: id);
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
          indEvents: r,
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

  void postRegister({required int id}) async {
    final result = await _registerService.postRegister(id: id);
    result.fold(
      (l) => emit(state.copyWith(
        isFailureOrSuccessForRegister: some(left(l)),
      )),
      (r) {
        emit(state.copyWith(
          isFailureOrSuccessForRegister: some(right(r)),
        ));
      },
    );
  }

  void getLikes({required int id}) async {
    final result = await _imgLikesService.getLikes(id: id);
    result.fold(
        (l) => emit(state.copyWith(
              isFailureOrSuccessForImgLikes: some(left(l)),
            )),
        (r) => emit(state.copyWith(
              isFailureOrSuccessForImgLikes: some(right(r)),
              likes: r,
            )));
  }
}
