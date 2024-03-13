import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/cecify/color/color_model.dart';
import 'package:vcec/domain/cecify/color/color_service.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';
import 'package:vcec/domain/cecify/episodes/episodes_service.dart';
import 'package:vcec/domain/cecify/filter_seasons/season_model.dart';
import 'package:vcec/domain/cecify/filter_seasons/season_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'cecify_cubit.freezed.dart';
part 'cecify_state.dart';

@injectable
class CecifyCubit extends Cubit<CecifyState> {
  final SeasonService _seasonService;
  final ColorService _colorService;
  final EpisodesService _episodesService;
  CecifyCubit(this._seasonService, this._colorService, this._episodesService)
      : super(CecifyState.initial());

  void getColors() async {
    log("magaaaaaa");
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _colorService.getFilterColors();
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      log("colors" + r.toString());
      getEpisodes(r.first.season!);
      emit(state.copyWith(
        colors: r,
        isFailureOrSuccess: some(right(null)),
      ));
    });
  }

  void getEpisodes(int season) async {
    emit(state.copyWith(
      selectedSeason: season,
      isLoading: true,
      isFirstFetch: true,
      isFailureOrSuccess: none(),
    ));
    final result = await _episodesService.getFilterEpisodes(season);
    result.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) {
      emit(state.copyWith(
        isLoading: false,
        episodes: r,
        isFailureOrSuccess: some(right(null)),
      ));
    });
  }
}
