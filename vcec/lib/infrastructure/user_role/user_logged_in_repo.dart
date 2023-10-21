import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/user/user_logged_in_service.dart';
@LazySingleton(as: IsUserService)
class IsUserRepo implements IsUserService {
  @override
  Future<bool> isUserLoggedin() async {
    final sharedPref = await SharedPreferences.getInstance();
    final isUserLoggedIn = sharedPref.getString('access_token');
    if (isUserLoggedIn == null) {
      return false;
    } else {
      EmailModel.instance.accessToken = isUserLoggedIn;
      return true;
    }
  }
}
