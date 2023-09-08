import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/departments/department_model/result.dart';
import 'package:vcec/domain/departments/search/department_model/staff_info.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';

abstract class DepartmentSearchService {
  Future<Either<MainFailure, List<Staff>>> searchDepartments(
      String query, Department? deptType);
}
