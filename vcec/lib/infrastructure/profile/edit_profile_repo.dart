import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EditProfileService)
class EditProfileRepo extends EditProfileService {
  @override
  Future<Either<MainFailure, bool>> putProfileDetails(
      {required String name,
      required String email,
      required String adno,
      required String sem,
      required String branch,
      required String regno,
      required String div,
      required String ieeeno}) async {
    try {
      final accessToken = AuthTokenManager.instance.accessToken;
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await Dio(BaseOptions(
        headers: headers,
      )).put('${baseUrl}users/auth/update/', data: {
        'name': name,
        'email': email,
        'admission_no': adno,
        'register_no': regno,
        'ieee_membership_no': ieeeno,
        'branch': branch,
        'semester': sem,
        'division': div,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(true);
      } else {
        log('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
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
