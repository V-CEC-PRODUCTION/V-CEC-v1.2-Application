import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/model/ind_events_model/ind_events_model.dart';
import 'package:vcec/domain/events/model/ind_events_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'indeventscubit_cubit.freezed.dart';
part 'indeventscubit_state.dart';

@injectable
class IndEventsCubit extends Cubit<IndEventsState> {
  IndEventsCubit(this._indEventsService) : super(IndEventsState.initial());
  final IndEventsService _indEventsService;

  void getIndEvents({required int id}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _indEventsService.getIndEvents(id: id);
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
  }
}
