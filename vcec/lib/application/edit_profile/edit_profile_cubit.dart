import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/edit_profile_service/edit_profile_service.dart';
import 'package:vcec/domain/profile/update_profile_img_service/update_profile_img_service.dart';
import 'package:vcec/infrastructure/notification/notification_handle.dart';
part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileService, this._profileImgService)
      : super(EditProfileState.initial());
  final EditProfileService _editProfileService;
  final UpdateProfileImgService _profileImgService;

  putProfileDetails(
      {required String name,
      required String email,
      required String adno,
      required String sem,
      required String branch,
      required String regno,
      required String div,
      required String ieeeno,
      required File? image}) async {
    emit(state.copyWith(isLoading: true, failureOrSuccesss: none()));
    final profileEditResponce = await _editProfileService.putProfileDetails(
        name: name,
        email: email,
        adno: adno,
        sem: sem,
        branch: branch,
        regno: regno,
        div: div,
        ieeeno: ieeeno);
    await profileEditResponce.fold((l) {
      emit(state.copyWith(isLoading: false, failureOrSuccesss: some(left(l))));
    }, (r) async {
      if (image != null) {
        final imagePostResonce =
            await _profileImgService.putProfileImg(imageFile: image);
        imagePostResonce.fold((l) {
          emit(state.copyWith(
              isLoading: false, failureOrSuccesss: some(left(l))));
        }, (r) {
          BlocProvider.of<ProfileCubit>(navigatorKey.currentContext!)
              .getProfileDetails();
          emit(state.copyWith(
              isLoading: false, failureOrSuccesss: some(right(r))));
        });
      } else {
        BlocProvider.of<ProfileCubit>(navigatorKey.currentContext!)
            .getProfileDetails();
        emit(state.copyWith(
            isLoading: false, failureOrSuccesss: some(right(r))));
      }
    });
  }
}
