import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/departments/departments_search_screen.dart';
import 'package:vcec/presentation/departments/widgets/staff_tile.dart';

class ADepartmentScreen extends StatelessWidget {
  ADepartmentScreen(
      {super.key, required this.deptType, required this.department});
  final Department deptType;
  final String department;
  final ValueNotifier<SearchData> isSearchingNotifier =
      ValueNotifier<SearchData>(SearchData(searchText: '', isNotEmpty: false));
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DepartmentSearchCubit>(context)
          .searchDepartments('', deptType);
    });
    return Scaffold(
        appBar: AppbarWithSearch(
            isSearchNotifier: isSearchingNotifier,
            hintText: 'Search',
            department: deptType),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SubHeading(text: department.toUpperCase()),
              Expanded(
                child: DepartmentSearchScreen(
                  deptType: deptType,
                  value: isSearchingNotifier.value.isNotEmpty,
                  query: isSearchingNotifier.value.searchText,
                ),
              ),
            ],
          ),
        ));
  }
}
