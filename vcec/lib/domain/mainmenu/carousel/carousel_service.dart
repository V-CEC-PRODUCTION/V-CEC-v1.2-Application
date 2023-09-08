import 'package:dartz/dartz.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/carousel/carosel_model/result.dart';

//import 'package:vcec/domain/mainmenu/carousel/carousel_model/result.dart';

abstract class CarouselService {
  Future<Either<MainFailure, List<CarouselImage>>> getCarouselImages();
}
