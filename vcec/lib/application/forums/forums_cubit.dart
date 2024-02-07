import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/events/forums/forum_model/forum_role_name.dart';
import 'package:vcec/domain/events/forums/forums_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'forums_cubit.freezed.dart';
part 'forums_state.dart';

@injectable
class ForumsCubit extends Cubit<ForumsState> {
  final ForumsService _forumsService;
  ForumsCubit(this._forumsService) : super(ForumsState.initial());

  void getForums() async {
    emit(state.copyWith(
      forums: [],
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _forumsService.getForums();
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        forums: r,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }
}
