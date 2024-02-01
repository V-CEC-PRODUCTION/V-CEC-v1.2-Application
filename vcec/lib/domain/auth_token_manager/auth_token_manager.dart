import 'package:google_sign_in/google_sign_in.dart';

class AuthTokenManager {
  AuthTokenManager._internal();
  static AuthTokenManager instance = AuthTokenManager._internal();
  factory AuthTokenManager() => instance;
  String? _accessToken;
  String? _refreshToken;
  String? _email;
  String? _name;
  String? _imageUrl;
  String? _thumbnailUrl;
  GoogleSignInAccount? _googleuser;
  UserRole? _userRole;
  LoginType? _loginType;
  String? get email => _email;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  UserRole? get userRole => _userRole;
  LoginType? get logintype => _loginType;
  GoogleSignInAccount? get googleuser => _googleuser;
  String? get name => _name;
  String? get imageUrl => _imageUrl;
  String? get thumbnailUrl => _thumbnailUrl;
  setTokens({required String accessToken, required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = accessToken;
  }

  setDetails(
      {required String name,
      required String imageUrl,
      required String thumbnailUrl}) {
    _name = name;
    _imageUrl = imageUrl;
    _thumbnailUrl = thumbnailUrl;
  }

  setAccessToken(String accessToken) {
    _accessToken = null;
  }

  setUserAccount(GoogleSignInAccount googleuser) {
    _googleuser = googleuser;
  }

  setUserRole(UserRole userRole) {
    _userRole = userRole;
  }

  setLoginType(LoginType loginType) {
    _loginType = loginType;
  }

  setEmail(String email) {
    _email = email;
  }

  void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
    _email = null;
  }
}

enum UserRole { student, guest }

enum LoginType { email, google }
