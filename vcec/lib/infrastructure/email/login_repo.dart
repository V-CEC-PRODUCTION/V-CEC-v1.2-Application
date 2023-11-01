import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/email/email_service.dart';
import 'package:vcec/domain/email/login_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: LoginService)
class LoginRepo extends LoginService {
  @override
  Future<Either<MainFailure, bool>> getAccess(
      String email, String password) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .post('${baseUrl}users/auth/login/api/token/email/',
              data: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final EmailModel accessToken = EmailModel.fromJson(response.toString());
        EmailModel.instance.accessToken = accessToken.accessToken;
        EmailModel.instance.refreshToken = accessToken.refreshToken; 
        final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString(
            'access_token', accessToken.accessToken!);
        await sharedPreferences.setString(
            'refresh_token', accessToken.refreshToken!);
        print(EmailModel.instance.accessToken.toString());
        print(EmailModel.instance.refreshToken.toString());
        return const Right(true);
      } else {
        print('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      print('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}
