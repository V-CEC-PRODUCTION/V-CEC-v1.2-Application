import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'signup_with_google_state.dart';
part 'signup_with_google_cubit.freezed.dart';

@injectable
class SignupWithGoogleCubit extends Cubit<SignupWithGoogleState> {
  final SignupService _signupService;
  SignupWithGoogleCubit(this._signupService)
      : super(SignupWithGoogleState.initial());
  signUpWithGoogle() async {
    await _signupService.signUpWithGoogle();
  }
}
