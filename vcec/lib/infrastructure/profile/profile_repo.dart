import 'dart:developer';

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
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}users/auth/get/user/details/',);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ProfileModel profileData =
            ProfileModel.fromJson(response.toString());
        print('object');
        return Right(profileData);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e.toString());
      log('Client Errorrrr');
      return const Left(MainFailure.clientFailure());
    }
  }
}
