import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/authentication/forgot_password/forgot_password_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
part 'forgotpassword_cubit.freezed.dart';
part 'forgotpassword_state.dart';

@injectable
class ForgotpasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotpasswordCubit(this._forgotPasswordService)
      : super(ForgotPasswordState.initial());

  final ForgotPasswordService _forgotPasswordService;

  void postPassword({required String email}) async{
    emit(state.copyWith(
      
      isFailureOrSuccess: none(),
    ));
    final result = await _forgotPasswordService.postPassword(email: email);
    result.fold(
      (l) => emit(state.copyWith(
            
            isFailureOrSuccess: some(left(l)),
          )),
      (r) {
        emit(state.copyWith(
          
          isFailureOrSuccess: some(right(r)),
        ));
      },
    );

  }
}
