class AuthTokenManager {
  AuthTokenManager._internal();
  static AuthTokenManager instance = AuthTokenManager._internal();
  factory AuthTokenManager() => instance;
  String? _accessToken;
  String? _refreshToken;
  String? _name;
  String? get name => _name;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  setTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
    _name = null;
  }
}
