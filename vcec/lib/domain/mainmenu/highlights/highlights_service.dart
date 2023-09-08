import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights/highlight_info_image.dart';
import 'package:vcec/domain/mainmenu/highlights/highlights/highlights.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights_model/highlight.dart';

abstract class HighlightsService {
  Future<Either<MainFailure, HighlightsModel>> getHighlights();
}
