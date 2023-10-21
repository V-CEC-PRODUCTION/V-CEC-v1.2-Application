import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/email/email_model.dart';
import 'package:vcec/domain/failure/auth_failure.dart';
import 'package:vcec/domain/user/auth_service.dart';
import 'package:vcec/domain/user/request_service.dart';
import 'package:vcec/domain/user/user_logged_in_service.dart';
import 'package:vcec/domain/user/user_service.dart';
import 'package:vcec/domain/user/validate_service.dart';

part 'isloggedin_state.dart';
part 'isloggedin_cubit.freezed.dart';

@injectable
class IsloggedInCubit extends Cubit<IsLoggedInState> {
  final IsUserService userService;
  final ValidateService validateService;
  final RequestService _requestService;
  final AuthService authService;
  IsloggedInCubit(this.userService, this.validateService, this._requestService,
    this.authService)
      : super(IsLoggedInState.initial());

  loggedIn() async {
    final isUserLoggedIn = await userService.isUserLoggedin();
    if (isUserLoggedIn) {
      final response = await validateService.getValiadte();
       response.fold((l) {
        if (l is AuthFailure) {
          _requestService.getRequest().then((value) => value.fold((l) {
                if (l is AuthFailure) {
                  emit(state.copyWith(page: 'login'));
                } else {
                  emit(state.copyWith(msg: 'Something went wrong'));
                }
              }, (r) async {
                EmailModel.instance.accessToken = r.accessToken;
                await authService.deleteToken();
                await authService.saveToken();
                emit(state.copyWith(page: 'home'));
              }));
        }
        else{
          emit(state.copyWith(msg: "Something went wrong"));
        }
      }, (r) {
        emit(state.copyWith(page: 'home'));
      });
    }
    else{
      emit(state.copyWith(page: 'login'));
    }
  }
}
