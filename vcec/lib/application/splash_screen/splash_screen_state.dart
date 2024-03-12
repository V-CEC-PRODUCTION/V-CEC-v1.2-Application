part of 'splash_screen_cubit.dart';

@freezed
class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({required String page, required String msg}) =
      _SplashScreenState;
  factory SplashScreenState.initial() =>
      const SplashScreenState(page: '', msg: '');
}
