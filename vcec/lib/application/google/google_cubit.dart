import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/auth/google_service1.dart';
import 'package:vcec/domain/failure/main_failure.dart';

part 'google_state.dart';
part 'google_cubit.freezed.dart';

@injectable
class GoogleCubit extends Cubit<GoogleState> {
  final Authservice authservice;
  GoogleCubit(this.authservice) : super(GoogleState.initial());

  void googleSignIn() async {
    await authservice.googleSignIn().then((value) => value.fold(
        (l) => emit(state.copyWith(
            isSubmitting: false, authfailureorsuccess: Some(left(l)))),
        (r) => state.copyWith(
            isSubmitting: true, authfailureorsuccess: Some(Right(r)))));
  }
}
