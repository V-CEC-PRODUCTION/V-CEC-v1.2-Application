import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/authentication/signup/otp_model/otp_model.dart';
import 'package:vcec/domain/authentication/signup/signup_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'verify_email_state.dart';
part 'verify_email_cubit.freezed.dart';

@injectable
class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final SignupService _signupService;
  VerifyEmailCubit(this._signupService) : super(VerifyEmailState.initial());
  verifyEmail({required String email}) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _signupService.verifyEmail(email: email);
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(left(l)),
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(null)),
        otpModel: r,
      ));
    });
  }
}
