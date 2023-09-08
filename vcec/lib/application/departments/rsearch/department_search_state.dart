part of 'department_search_cubit.dart';

@freezed
class DepartmentSearchState with _$DepartmentSearchState {
  const factory DepartmentSearchState({
    required List<Staff> staffs,
    required Option<Either<MainFailure, List<Staff>>> failureOrSuccess,
  }) = _Initial;
  factory DepartmentSearchState.initial() {
    return _Initial(
      staffs: [],
      failureOrSuccess: none(),
    );
  }
}
