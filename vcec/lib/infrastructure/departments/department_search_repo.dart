import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
//import 'package:vcec/domain/departments/department_model/department_model.dart';
//import 'package:vcec/domain/departments/department_model/result.dart';
import 'package:dartz/dartz.dart';
//import 'package:vcec/domain/departments/search/department_model/department_model.dart';
import 'package:vcec/domain/departments/search/search_service.dart';
import 'package:vcec/domain/departments/search/staff/staff.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/strings/strings.dart';

@LazySingleton(as: DepartmentSearchService)
class DepartmentSearchRepo implements DepartmentSearchService {
  @override
  Future<Either<MainFailure, DepartmentModel>> searchDepartments(
      String query, Department? deptType, int pageNum) async {
    String dept;
    int pageCount = 7;
    switch (deptType) {
      case Department.as:
        dept = 'BSL';
        break;
      case Department.cs:
        dept = 'CSE';
        break;
      case Department.ec:
        dept = 'ECE';
        break;
      case Department.eee:
        dept = 'EEE';
        break;
      case Department.gs:
        dept = 'GE';
        break;
      case Department.lib:
        dept = 'LIB';
        break;
      case Department.fac:
        dept = 'FAC';
        break;
      default:
        dept = 'FAC';
        break;
    }
    try {
      print(dept);
      final respose = await Dio(BaseOptions(contentType: 'application/json')).get(
          '${baseUrl}staff/info/directory/search/$dept?search=$query&page=$pageNum&count=$pageCount');
      print('hiiiiiii');
      if (respose.statusCode == 200 || respose.statusCode == 201) {
        final dept = DepartmentModel.fromJson(respose.toString());
        return Right(dept);
      } else {
        log('errrr');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print(e);
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
