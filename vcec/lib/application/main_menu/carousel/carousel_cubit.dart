import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/carousel/carosel_model/result.dart';
import 'package:vcec/domain/mainmenu/carousel/carousel_service.dart';
//import 'package:vcec/domain/mainmenu/carousel/carousel_model/result.dart';

part 'carousel_state.dart';
part 'carousel_cubit.freezed.dart';

@injectable
class CarouselCubit extends Cubit<CarouselState> {
  final CarouselService _carouselService;
  CarouselCubit(this._carouselService) : super(CarouselState.initial());
  void getCarouselImages() async {
    await Future.delayed(Duration(seconds: 2));
    await _carouselService.getCarouselImages().then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            carouselImages: null,
            carouselFailureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            carouselImages: success,
            carouselFailureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
