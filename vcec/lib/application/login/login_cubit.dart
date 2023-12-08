import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/authentication/login/login_service.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginWithEmailAndGoogleCubit extends Cubit<LoginWithEmailAndGoogleState> {
  final LoginService _loginService;
  final SignupService _signupService;
  final AuthTokenService _authTokenService;
  LoginWithEmailAndGoogleCubit(
      this._loginService, this._authTokenService, this._signupService)
      : super(LoginWithEmailAndGoogleState.initial());
  loginWithEmailAndPass(String email, String password) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final response = await _loginService.loginWithEmailAndPass(email, password);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
      _authTokenService.deleteToken();
      _authTokenService.saveToken();
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(null)),
      ));
    });
  }

  loginWithGoogle() async {
    emit(state.copyWith(isFailureOrSuccessForGoogle: none(), isLoading: true));
    final response = await _signupService.signUpWithGoogle();
    response.fold((l) {
       emit(state.copyWith(
            isFailureOrSuccessForGoogle: some(left(l)), isLoading: false));
    }, (r) async {
      final finalResponse = await _loginService.loginWithGoogle(r.email!);
      finalResponse.fold((l) {
        _signupService.signOut();
        emit(state.copyWith(
            isFailureOrSuccessForGoogle: some(left(l)), isLoading: false));
      }, ((r) {
        _signupService.signOut();
        _authTokenService.deleteToken();
        _authTokenService.saveToken();
        emit(state.copyWith(
            isFailureOrSuccessForGoogle: some(right(null)), isLoading: false));
      }));
    });
  }
}
