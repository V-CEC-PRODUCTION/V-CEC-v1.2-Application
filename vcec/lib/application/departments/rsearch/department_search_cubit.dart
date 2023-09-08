import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
//import 'package:vcec/domain/departments/department_model/result.dart';
import 'package:vcec/domain/departments/search/department_model/staff_info.dart';
import 'package:vcec/domain/departments/search/search_service.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';

part 'department_search_state.dart';
part 'department_search_cubit.freezed.dart';

@injectable
class DepartmentSearchCubit extends Cubit<DepartmentSearchState> {
  final DepartmentSearchService _searchService;
  DepartmentSearchCubit(this._searchService)
      : super(DepartmentSearchState.initial());
  void searchDepartments(String query, Department? deptType) async {
    emit(state.copyWith(
      staffs: [],
      failureOrSuccess: none(),
    ));
    final result = await _searchService.searchDepartments(query, deptType);
    result.fold(
      (l) => emit(state.copyWith(
        failureOrSuccess: some(left(l)),
      )),
      (r) => emit(state.copyWith(
        staffs: r,
        failureOrSuccess: some(right(r)),
      )),
    );
  }
}
