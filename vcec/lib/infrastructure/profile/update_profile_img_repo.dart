import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: UpdateProfileImgService)
class UpdateProfileImgRepo extends UpdateProfileImgService {
  @override
  Future<Either<MainFailure, bool>> putProfileImg(
      {required File imageFile}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      var request = http.MultipartRequest(
          'PUT', Uri.parse('${baseUrl}users/auth/update/photo/'));

      // Add the file to the request
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      // Set the headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $accessToken',
      });

      // Send the request
      http.Response response =
          await http.Response.fromStream(await request.send());
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 401) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
