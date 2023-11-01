import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/google_service1.dart';
import 'package:vcec/domain/email/login_google_service.dart';
import 'package:vcec/domain/email/login_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'user_state.dart';
part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final Authservice authservice;
  final LoginService emailService;
  final LogInGoogleService googleService;
  UserCubit(
    this.authservice,
    this.emailService,
    this.googleService,
  ) : super(UserState.initial());

  void googleSignIn() async {
    await authservice.googleSignIn().then((value) => value.fold(
            (l) => emit(state.copyWith(
                value: false,
                user: null,
                authfailureorsuccess: Some(left(l)))), (r) async {
          emit(state.copyWith(loading: false));
          await googleService.getAccess(r.email!).then((value) {
            value.fold(
              (failure) => emit(state.copyWith(
                  authfailureorsuccess: Some(Left(failure)), value: true)),
              (success) {
                emit(state.copyWith(
                    authfailureorsuccess: Some(Right(success)),
                    value: false,
                    loading: true));
              },
            );
          });
          emit(state.copyWith(
            value: false,
            user: r,
          ));
        }));
  }

  login({required String email, required String password}) async {
    final response = await emailService.getAccess(email, password);
    response.fold(
      (failure) => emit(
          state.copyWith(value: false, FailureOrSuccess: Some(Left(failure)))),
      (success) => emit(
          state.copyWith(FailureOrSuccess: Some(Right(success)), value: true)),
    );
  }
}
