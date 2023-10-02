import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/otp_model.dart';
import 'package:vcec/domain/auth/otp_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'otp_state.dart';
part 'otp_cubit.freezed.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  final OtpService _otpService;
  OtpCubit(this._otpService) : super(OtpState.initial());
  postEmail({required String email}) async {
    await _otpService.postEmail(email).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            value: true, otp: null, otpFailureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            value: false,
            otp: success,
            otpFailureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
