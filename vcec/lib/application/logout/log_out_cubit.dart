import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'log_out_cubit.freezed.dart';

part 'log_out_state.dart';

@injectable
class LogOutCubit extends Cubit<LogOutState> {
  final SignupService _signupService;
  final AuthTokenService _authTokenService;
  LogOutCubit(this._signupService, this._authTokenService)
      : super(LogOutState.initial());

  logOut() async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final validationResponse = await _authTokenService.validateToken();
    validationResponse.fold((l) async {
      if(l is AuthFailure)
      {
         final refreshTokenResponse = await _authTokenService.getAccessToken();
      refreshTokenResponse.fold((l) {}, (r) async{
         final response = await _signupService.logOut();
    response.fold(
        (l) => {
              emit(state.copyWith(
                  isLoading: false, isFailureOrSuccess: some(left(l))))
            },
        (r) => {
              _authTokenService.deleteToken(),
              emit(state.copyWith(
                  isLoading: false, isFailureOrSuccess: some(right(r))))
            });
      });
      }
     
    }, (r) async{
       final response = await _signupService.logOut();
    response.fold(
        (l) => {
              emit(state.copyWith(
                  isLoading: false, isFailureOrSuccess: some(left(l))))
            },
        (r) => {
              _authTokenService.deleteToken(),
              emit(state.copyWith(
                  isLoading: false, isFailureOrSuccess: some(right(r))))
            });
    });
  }
}
