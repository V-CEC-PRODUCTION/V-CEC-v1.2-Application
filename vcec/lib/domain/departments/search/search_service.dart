import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/departments/search/department_model/department_model.dart';
import 'package:vcec/domain/departments/search/staff/staff.dart';
//import 'package:vcec/domain/departments/department_model/result.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';

abstract class DepartmentSearchService {
  Future<Either<MainFailure, DepartmentModel>> searchDepartments(
      String query, Department? deptType, int pageNum);
}
