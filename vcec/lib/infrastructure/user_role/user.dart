import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/user_model.dart';
import 'package:vcec/domain/user/user_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: UserService)
class UserRepo implements UserService {
  @override
  Future<Either<dynamic, bool>> getAccess() async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(headers: headers))
          .get('${baseUrl}users/auth/get/user/role/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final role = UserModel.fromJson(response.toString());
        UserModel.instance.role = role.role;
        print(role.toString());
        return Right(true);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 401) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.clientFailure());
      }
    }
  }

  @override
  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String imei = androidInfo.id;
    print(imei);
    return imei;
  }
}
