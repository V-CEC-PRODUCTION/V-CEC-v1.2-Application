import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/profile/profile_model/profile_model.dart';
import 'package:vcec/domain/profile/profile_service/profile_service.dart';
part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileService) : super(ProfileState.initail());

  final ProfileService _profileService;

  getProfileDetails() async {
    emit(state.copyWith(isLoading: true, failureOrSuccess: none()));

    await _profileService.getProfileDetails().then((either) => either.fold(
        (l) => emit(state.copyWith(
            isLoading: false,
            failureOrSuccess: some(left(l)),
            profileModel: null)),
        (r) => emit(state.copyWith(
            isLoading: false,
            failureOrSuccess: some(right(r)),
            profileModel: r))));
  }
}
