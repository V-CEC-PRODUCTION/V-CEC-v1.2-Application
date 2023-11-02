class AuthTokenManager {
  AuthTokenManager._internal();
  static AuthTokenManager instance = AuthTokenManager._internal();
  factory AuthTokenManager() => instance;
  String? _accessToken;
  String? _refreshToken;
  String? _email;
  UserRole? _userRole;
  String? get email => _email;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  UserRole? get userRole => _userRole;
  setTokens({required String accessToken,required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  setUserRole(UserRole userRole) {
    _userRole = userRole;
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
