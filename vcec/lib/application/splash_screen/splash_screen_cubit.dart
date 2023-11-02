import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';

import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/splash_screen/splash_screen_service.dart';
part 'splash_screen_state.dart';
part 'splash_screen_cubit.freezed.dart';

@injectable
class SplashScreenCubit extends Cubit<SplashScreenState> {
  final SplashScreenService _splashScreenService;
  final AuthTokenService _authTokenService;
  SplashScreenCubit(this._splashScreenService, this._authTokenService)
      : super(SplashScreenState.initial());

  loggedIn() async {
    final isUserLoggedIn = await _splashScreenService.isUserLoggedIn();
    if (isUserLoggedIn) {
      final response = await _authTokenService.validateToken();
      await response.fold((l) async {
        if (l is AuthFailure) {
          final getNewAccessTokenResponce =
              await _authTokenService.getAccessToken();
          await getNewAccessTokenResponce.fold((l) {
            if (l is AuthFailure) {
              emit(state.copyWith(page: '/login'));
            } else {
              emit(state.copyWith(msg: 'Something went wrong'));
            }
          }, (r) async {
            await _authTokenService.deleteToken();
            await _authTokenService.saveToken();
            emit(state.copyWith(page: '/home'));
          });
        } else {
          emit(state.copyWith(msg: "Something went wrong"));
        }
      }, (r) {
        emit(state.copyWith(page: '/home'));
      });
    } else {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(page: '/login'));
    }
  }
}
