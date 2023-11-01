import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


import 'package:vcec/domain/user/add_user_service.dart';

part 'adduser_state.dart';
part 'adduser_cubit.freezed.dart';

@injectable
class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this._addUserService) : super( AddUserState.initial());
  final AddUserService _addUserService;

  accountDetails(String name,String? branch,String? sem,String? batch
  ,String? adno,String? gender,String deviceid) async {
    
    await _addUserService
        .accountDeatils(name, branch, sem, batch, adno, gender, deviceid)
        .then((value) => value.fold((l) => {}, (r) => emit(state.copyWith(value: false))));
  }
}
