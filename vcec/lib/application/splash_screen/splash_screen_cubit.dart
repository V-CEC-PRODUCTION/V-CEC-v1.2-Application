import 'dart:developer';

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
    log(isUserLoggedIn.toString() + " isUserLoggedIn");
    if (isUserLoggedIn) {
      log("1");
      final response = await _authTokenService.validateToken();
      log(response.toString());
      await response.fold((l) async {
        log("2.1");
        if (l is AuthFailure) {
          log("2.1.1");
          log("access token expired");
          final getNewAccessTokenResponce =
              await _authTokenService.getAccessToken();
          log(getNewAccessTokenResponce.toString());
          await getNewAccessTokenResponce.fold((l) {
            log("3.1");
            if (l is AuthFailure) {
              print("refresh token expired");
              emit(state.copyWith(page: '/login'));
            } else {
              emit(state.copyWith(msg: 'Something went wrong1'));
            }
          }, (r) async {
            log("3.2");
            await _authTokenService.deleteToken();
            await _authTokenService.saveToken();
            emit(state.copyWith(page: '/home'));
          });
        } else {
          log("2.1.2");
          emit(state.copyWith(msg: "Something went wrong2"));
        }
      }, (r) {
        log("2.2");
        emit(state.copyWith(page: '/home'));
      });
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(page: '/login'));
    }
  }
}
