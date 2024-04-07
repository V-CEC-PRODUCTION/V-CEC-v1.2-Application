part of 'department_search_cubit.dart';

@freezed
class DepartmentSearchState with _$DepartmentSearchState {
  const factory DepartmentSearchState({
    required List<Staff> staffs,
    required Option<Either<MainFailure, List<Staff>>> failureOrSuccess,
    required bool isFirstFetch,
    required bool isLoading,
    required bool hasNext,
    required Department department,
  }) = _Initial;
  factory DepartmentSearchState.initial() {
    return _Initial(
        staffs: [],  
        failureOrSuccess: none(),
        isFirstFetch: false,
        isLoading: false,
        hasNext: true,
        department: Department.fac);
  }
}
