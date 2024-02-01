import 'package:flutter/material.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/departments/departments_idle_screen.dart';
import 'package:vcec/presentation/departments/departments_search_screen.dart';
import 'package:vcec/presentation/departments/widgets/staff_tile.dart';

class DepartmentsScreen extends StatelessWidget {
  DepartmentsScreen({super.key});
  final ValueNotifier<SearchData> isSearchingNotifier = ValueNotifier<SearchData>(SearchData(searchText: '', isNotEmpty: false));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWithSearch(
          isSearchNotifier: isSearchingNotifier,
          hintText: 'Search',
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                  valueListenable: isSearchingNotifier,
                  builder: (context, value, child) {
                    return Expanded(
                      child: value.isNotEmpty
                          ? DepartmentSearchScreen(
                              deptType: Department.fac,value: value.isNotEmpty, query: value.searchText,
                            )
                          : DepartmentsIdleScreen(),
                    );
                  }),
            ],
          ),
        ));
  }
}
