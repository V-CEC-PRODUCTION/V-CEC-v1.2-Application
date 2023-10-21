import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/email/email_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: EmailService)
class EmailRepo extends EmailService {
   
  @override
  Future<Either<MainFailure, bool>> getAccessToken(
      String email, String password) async {
    try {
      final response = await Dio(BaseOptions(contentType: 'application/json'))
          .post('${baseUrl}users/auth/sign-up/email/',
              data: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final EmailModel accessToken = EmailModel.fromJson(response.toString());
        EmailModel.instance.accessToken = accessToken.accessToken;
        EmailModel.instance.refreshToken = accessToken.refreshToken;
        print(EmailModel.instance.accessToken.toString());
        print(EmailModel.instance.refreshToken.toString());
         final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('access_token', accessToken.accessToken!);
        await sharedPreferences.setString('refresh_token', accessToken.refreshToken!);
        return const Right(true);
      } else {
        print('Server Error');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('Client Error');
      return const Left(MainFailure.clientFailure());
    }
  }
}
