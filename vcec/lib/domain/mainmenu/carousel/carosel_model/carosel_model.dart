import 'dart:convert';

import 'result.dart';

class CarouselModel {
  List<CarouselImage>? carouselImage;

  CarouselModel({this.carouselImage});

  factory CarouselModel.fromMap(Map<String, dynamic> data) => CarouselModel(
        carouselImage: (data['homepage_images'] as List<dynamic>?)
            ?.map((e) => CarouselImage.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'homepage_images': carouselImage?.map((e) => e.toMap()).toList(),
      };
  factory CarouselModel.fromJson(String data) {
    return CarouselModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'CarouselModel(result: $carouselImage)';
  }
}
