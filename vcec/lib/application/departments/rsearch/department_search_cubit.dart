import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
//import 'package:vcec/domain/departments/department_model/result.dart';
//import 'package:vcec/domain/departments/search/department_model/staff_info.dart';
import 'package:vcec/domain/departments/search/search_service.dart';
import 'package:vcec/domain/departments/search/staff/staff_info.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';

part 'department_search_state.dart';
part 'department_search_cubit.freezed.dart';

@injectable
class DepartmentSearchCubit extends Cubit<DepartmentSearchState> {
  final DepartmentSearchService _searchService;
  DepartmentSearchCubit(this._searchService)
      : super(DepartmentSearchState.initial());
  bool _searchDepartmentsIsExecuting = false;
  bool _searchDepartmentsWithSearchBarIsExecuting = false;
  int pageNum = 1;
  int pageNum1 = 1;
  void searchDepartments(
    String query,
    Department? deptType,
  ) async {
    if (!_searchDepartmentsIsExecuting &&
        _searchDepartmentsWithSearchBarIsExecuting == false) {
      _searchDepartmentsIsExecuting = true;
      log(pageNum.toString());
      if (state.department != deptType) {
        pageNum = 1;
      }
      if (state.department != deptType || state.isFirstFetch == true) {
        emit(state.copyWith(
          staffs: [],
          failureOrSuccess: none(),
          isFirstFetch: pageNum == 1,
          isLoading: true,
          department: deptType!,
        ));
      } else {
        emit(state.copyWith(
          failureOrSuccess: none(),
          isFirstFetch: pageNum == 1,
          isLoading: true,
        ));
      }
      final result =
          await _searchService.searchDepartments(query, deptType, pageNum);
      result.fold(
        (l) {
          emit(state.copyWith(
            failureOrSuccess: some(left(l)),
            isLoading: false,
          ));
          _searchDepartmentsIsExecuting = false;
        },
        (r) {
          List<Staff> updatedStaffs = List.from(state.staffs);
          updatedStaffs.addAll(r.staffInfo!);
          emit(state.copyWith(
            staffs: updatedStaffs,
            failureOrSuccess: some(right(updatedStaffs)),
            isLoading: false,
            hasNext: r.hasNext!,
          ));
          _searchDepartmentsIsExecuting = false;
          pageNum++;
          if (pageNum >= 2) {
            emit(state.copyWith(
              isFirstFetch: false,
            ));
          }
        },
      );
    }
  }

  void searchDepartmentsWithSearchBar(
      String query, Department? deptType, bool scrolled) async {
    if (!_searchDepartmentsWithSearchBarIsExecuting &&
        _searchDepartmentsIsExecuting == false) {
      pageNum = 1;
      _searchDepartmentsWithSearchBarIsExecuting = true;
      if (state.department != deptType || state.isFirstFetch == true) {
        emit(state.copyWith(
          staffs: [],
          failureOrSuccess: none(),
          isFirstFetch: pageNum1 == 1,
          isLoading: true,
        ));
      } else {
        emit(state.copyWith(
          failureOrSuccess: none(),
          isFirstFetch: pageNum1 == 1,
          isLoading: true,
        ));
      }
      final result =
          await _searchService.searchDepartments(query, deptType, pageNum1);
      result.fold(
        (l) {
          emit(state.copyWith(
            failureOrSuccess: some(left(l)),
            isLoading: false,
          ));
          _searchDepartmentsWithSearchBarIsExecuting = false;
        },
        (r) {
          List<Staff> updatedStaffs = List.from(state.staffs);
          updatedStaffs.addAll(r.staffInfo!);
          emit(state.copyWith(
            staffs: updatedStaffs,
            failureOrSuccess: some(right(updatedStaffs)),
            isLoading: false,
            hasNext: r.hasNext!,
          ));
          // print(r.hasNext);
          _searchDepartmentsWithSearchBarIsExecuting = false;
          if (scrolled) {
            pageNum1++;
          }
        },
      );
    }
  }
}
