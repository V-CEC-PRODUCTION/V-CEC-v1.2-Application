import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/user/auth_service.dart';
@LazySingleton(as: AuthService)
class AuthRepo implements AuthService{
  @override
  Future<void> deleteToken() async{
   final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.remove('access_token');
  }

  @override
  Future<void> saveToken() async{
   final token = EmailModel.instance.accessToken;
     final sharedPreferences = await SharedPreferences.getInstance();
        await sharedPreferences.setString('access_token', token!);
  }

}