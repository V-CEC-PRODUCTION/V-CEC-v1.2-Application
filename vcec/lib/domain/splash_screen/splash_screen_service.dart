abstract class SplashScreenService {
  Future<bool> isUserLoggedIn();
  Future<bool> isWelcomeCompleted();
  Future<void> regWelcome();
}
