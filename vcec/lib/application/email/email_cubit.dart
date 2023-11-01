import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_sevice.dart';
import 'package:vcec/domain/email/email_service.dart';

import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/user_service.dart';

part 'email_state.dart';
part 'email_cubit.freezed.dart';

@injectable
class EmailCubit extends Cubit<EmailState> {
  final EmailService emailService;
  final UserService _userService;
  final AuthTokenService _requestService;
  EmailCubit(
    this.emailService,
    this._userService,
    this._requestService,
  ) : super(EmailState.initial());

  accessToken({required String email, required String password}) async {
    await emailService.getAccessToken(email, password).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            failureOrSuccess: Some(Left(failure)), submit: true)),
        (success) async {
          emit(state.copyWith(loading: false));
          String id = await _userService.getDeviceId();
          emit(state.copyWith(deviceId: id));
          await _userService.getAccess().then((value) => value.fold((l) {
                if (l is AuthFailure) {
                  _requestService.
                    getAccessToken()
                      .then((value) => value.fold((l) {}, (r) {
                            _userService.getAccess();
                          }));
                }
              }, (r) => emit(state.copyWith(loading: true,submit: false))));
          emit(state.copyWith(
              failureOrSuccess: Some(Right(success)),));
        },
      );
    });
  }
}
