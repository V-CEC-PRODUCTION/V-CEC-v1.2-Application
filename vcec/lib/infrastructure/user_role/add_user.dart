import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/add_user_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: AddUserService)
class AddUserRepo implements AddUserService {
  @override
  Future<Either<MainFailure, bool>> accountDeatils(
      String name,
      String? branch,
      String? sem,
      String? batch,
      String? adno,
      String? gender,
      String deviceid) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .post('${baseUrl}users/auth/add/user/detail/', data: {
        "name": name,
        "branch": branch,
        "semester": sem,
        "division": batch,
        "admission_no": adno,
        "gender": gender,
        "device_id": deviceid,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("hi");
        return const Right(true);
      } else {
        print('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('Client Errorrrr');
      return const Left(MainFailure.clientFailure());
    }
  }
}
