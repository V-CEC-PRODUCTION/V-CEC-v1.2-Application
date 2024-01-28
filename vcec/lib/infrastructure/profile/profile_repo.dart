import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/profile_model/profile_model.dart';
import 'package:vcec/domain/profile/profile_service/profile_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: ProfileService)
class ProfileRepo extends ProfileService {
  @override
  Future<Either<MainFailure, ProfileModel>> getProfileDetails() async {
    try {
      print('1');
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers)).get(
        '${baseUrl}users/auth/get/user/details/',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ProfileModel profileData =
            ProfileModel.fromJson(response.toString());
        print('object');
        AuthTokenManager.instance.setDetails(imageUrl: profileData.imageUrl!,name: profileData.name!,thumbnailUrl: profileData.thumbnailUrl!);
        return Right(profileData);
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
