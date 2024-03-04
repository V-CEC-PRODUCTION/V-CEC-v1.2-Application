import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/splash_screen/splash_screen_service.dart';
import 'dart:developer';

@LazySingleton(as: SplashScreenService)
class SplashScreenRepo extends SplashScreenService {
  @override
  Future<bool> isUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final accessToken = sharedPref.getString('access_token');
    final refreshToken = sharedPref.getString('refresh_token');
    if (accessToken == null && refreshToken == null) {
      return false;
    } else {
      log(accessToken.toString());
      AuthTokenManager.instance
          .setTokens(accessToken: accessToken!, refreshToken: refreshToken!);
      return true;
    }
  }

  @override
  Future<bool> isWelcomeCompleted() async {
    final sharedPref = await SharedPreferences.getInstance();
    final isWelcome = sharedPref.getInt('welcome');
    if (isWelcome != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> regWelcome() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setInt('welcome', 1);
    return;
  }
}
