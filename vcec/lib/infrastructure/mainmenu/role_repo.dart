//import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
//import 'package:vcec/domain/mainmenu/timetable/timetable_model/time_table.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vcec/domain/mainmenu/timetable/role_model/user_role_model.dart';
import 'package:vcec/domain/mainmenu/timetable/user_role_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: RoleService)
class TimeTableRespository implements RoleService {
  @override
  Future<Either<MainFailure, UserRoleModel>> getRole() async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(
        headers: headers,
      )).get('${baseUrl}users/auth/get/user/role/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final UserRoleModel role = UserRoleModel.fromJson(response.toString());

        return Right(role);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
