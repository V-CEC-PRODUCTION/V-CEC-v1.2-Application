import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights/highlight_info_image.dart';
import 'package:vcec/domain/mainmenu/highlights/highlights/highlights.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights/highlights.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights_model/highlight.dart';
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart';

part 'highlights_state.dart';
part 'highlights_cubit.freezed.dart';

@injectable
class HighlightsCubit extends Cubit<HighlightsState> {
  final HighlightsService _highlightsService;
  HighlightsCubit(this._highlightsService) : super(HighlightsState.initial());
  void getHighlights() async {
    final highlights = await _highlightsService.getHighlights();
    log(highlights.toString());
    highlights.fold(
      (failure) => emit(state.copyWith(
          highlights: null, highlightsSuccessOrFailure: Some(Left(failure)))),
      (success) => emit(
        state.copyWith(
            highlights: success,
            highlightsSuccessOrFailure: Some(Right(success))),
      ),
    );
  }
}
