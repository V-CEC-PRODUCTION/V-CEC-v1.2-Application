import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/email/email_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'email_state.dart';
part 'email_cubit.freezed.dart';

class EmailCubit extends Cubit<EmailState> {
  final EmailService emailService;
  EmailCubit(this.emailService) : super(EmailState.initial());

   accessToken({required String email, required String password}) async {
    await emailService.getAccessToken(email,password).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
            accessToken: null,
            failureOrSuccess: Some(Left(failure)))),
        (success) => emit(state.copyWith(
            accessToken: success,
            failureOrSuccess: Some(Right(success)))),
      );
    });
  }
}
