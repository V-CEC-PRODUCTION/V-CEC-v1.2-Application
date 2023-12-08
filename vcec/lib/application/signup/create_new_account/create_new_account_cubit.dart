import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/authentication/signup/user_details_enum/user_details.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'create_new_account_state.dart';
part 'create_new_account_cubit.freezed.dart';

@injectable
class CreateNewAccountCubit extends Cubit<CreateNewAccountState> {
  final SignupService _signupService;
  final AuthTokenService _authTokenService;
  CreateNewAccountCubit(this._signupService, this._authTokenService)
      : super(CreateNewAccountState.initial());
  createNewAccount({
    required String email,
    required String password,
    required UserDetailsModel userDetailsModel,
  }) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    if (AuthTokenManager.instance.logintype == LoginType.email) {
      final response = await _signupService.signUp(
        email: email,
        password: password,
      );
      await response.fold((l) {
        emit(state.copyWith(
          isLoading: false,
          isFailureOrSuccess: some(left(l)),
        ));
      }, (r) async {
        final postUserDetailsResponse = await _signupService.postUserDetails(
          userDetailsModel: userDetailsModel,
        );
        postUserDetailsResponse.fold((l) {
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
      });
    } else {
      final email = AuthTokenManager.instance.email;
      final response =
          await _signupService.signUpWithGoogleFromAccounts(email: email!);
      await response.fold((l) {
        emit(state.copyWith(
          isLoading: false,
          isFailureOrSuccess: some(left(l)),
        ));
      }, (r) async {
        final postUserDetailsResponse = await _signupService.postUserDetails(
          userDetailsModel: userDetailsModel,
        );
        postUserDetailsResponse.fold((l) {
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
      });
    }
  }
}
