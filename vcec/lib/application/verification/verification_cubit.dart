import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/verification_service.dart';

import '../../domain/auth/otp_model.dart';
import '../../domain/failure/main_failure.dart';

part 'verification_state.dart';
part 'verification_cubit.freezed.dart';

@injectable
class VerificationCubit extends Cubit<VerificationState> {
  final VerificationService _otpService;
  VerificationCubit(this._otpService) : super(VerificationState.initial());
  postCode({required String code}) async {
    await _otpService.postCode(code).then((value) {
      value.fold(
        (failure) =>
            emit(state.copyWith(otpFailureOrSuccess: Some(Left(failure)))),
        (success) =>
            emit(state.copyWith(otpFailureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
