import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/model/events_views_service.dart';
import 'package:vcec/domain/events/model/ind_events_model/ind_events_model.dart';
import 'package:vcec/domain/events/model/ind_events_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'indeventscubit_cubit.freezed.dart';
part 'indeventscubit_state.dart';

@injectable
class IndEventsCubit extends Cubit<IndEventsState> {
  IndEventsCubit(this._indEventsService, this._viewsService)
      : super(IndEventsState.initial());
  final IndEventsService _indEventsService;
  final ViewsService _viewsService;

  void getIndEvents({required int id}) async {
    final result1 = await _viewsService.postView(id: id);
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
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
}
