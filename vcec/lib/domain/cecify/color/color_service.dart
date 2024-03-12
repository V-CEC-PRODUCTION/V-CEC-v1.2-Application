import 'package:dartz/dartz.dart';
import 'package:vcec/domain/cecify/color/color_model.dart';
import 'package:vcec/domain/failure/main_failure.dart';

abstract class ColorService {
  Future<Either<MainFailure, List<ColorResult>>> getFilterColors();
}
