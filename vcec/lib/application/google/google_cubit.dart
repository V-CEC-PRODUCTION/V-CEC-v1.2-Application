import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/google_service1.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/email/login_google_service.dart';
import 'package:vcec/domain/email/login_service.dart';
import 'package:vcec/domain/email/sign_in_google_service.dart';
import 'package:vcec/domain/failure/auth_failure.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/user/request_service.dart';
import 'package:vcec/domain/user/user_service.dart';
import '../../domain/auth/otp_service.dart';
part 'google_state.dart';
part 'google_cubit.freezed.dart';

@injectable
class GoogleCubit extends Cubit<GoogleState> {
  final Authservice authservice;
  final OtpService _otpService;
  final LoginService emailService;
  final SignInGoogleService googleService;
  final UserService _userService;
  final RequestService _requestService;
  GoogleCubit(this.authservice, this._otpService, this.emailService,
      this.googleService, this._userService, this._requestService)
      : super(GoogleState.initial());

  void googleSignIn() async {
    await authservice.googleSignIn().then((value) => value.fold(
            (l) => emit(state.copyWith(
                isSubmitting: false,
                user: null,
                authfailureorsuccess: Some(left(l)))), (r) async{
          await googleService.getAccessToken(r.email!).then((value) {
      value.fold(
        (failure) => emit(
            state.copyWith(authfailureorsuccess: Some(Left(failure)), isSubmitting: true)),
        (success) async{
           emit(state.copyWith(loading: false));
          String id = await _userService.getDeviceId();
          emit(state.copyWith(deviceId: id));
          await _userService.getAccess().then((value) => value.fold((l) {
                if (l is AuthFailure) {
                  _requestService
                      .getRequest()
                      .then((value) => value.fold((l) {}, (r) {
                            _userService.getAccess();
                          }));
                }
              }, (r) => emit(state.copyWith(authfailureorsuccess: Some(Right(success)),loading: true,isSubmitting: false))));
        
        },
      );
    });        
          emit(state.copyWith(
              isSubmitting: true,
              user: r,
              ));
        }));
  }

  postEmail({required String email}) async {
    await _otpService.postEmail(email).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            isSubmitting: true,
            otp: null,
            otpFailureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            isSubmitting: false,
            otp: success,
            otpFailureOrSuccess: Some(Right(success)))),
      );
    });
  }

  login({required String email, required String password}) async {
    await emailService.getAccess(email, password).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            isSubmitting: false, FailureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            FailureOrSuccess: Some(Right(success)), isSubmitting: true)),
      );
    });
  }
}
