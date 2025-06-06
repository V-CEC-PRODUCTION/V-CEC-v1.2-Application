//import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights/highlight_info_image.dart';
import 'package:vcec/domain/mainmenu/highlights/highlights/highlights.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights_model/highlight.dart';
//import 'package:vcec/domain/mainmenu/highlights/highlights_model/highlights_model.dart';
import 'package:vcec/domain/mainmenu/highlights/highlights_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: HighlightsService)
class HighlightsRepo implements HighlightsService {
  @override
  Future<Either<MainFailure, HighlightsModel>> getHighlights() async {
    try {
       final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Token 31e96b68c0f2187950dbf9d0c83c688facbeba62',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}highlights/cec/images');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final highlights = HighlightsModel.fromJson(response.toString());
        return Right(highlights);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
