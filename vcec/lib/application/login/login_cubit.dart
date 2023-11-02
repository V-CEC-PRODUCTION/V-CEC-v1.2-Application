import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/authentication/login/login_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/notices/notice_model/notices_result.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginService _loginService;
  final AuthTokenService _authTokenService;
  LoginCubit(this._loginService, this._authTokenService)
      : super(LoginState.initial());
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
}
