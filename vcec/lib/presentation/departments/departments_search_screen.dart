import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/departments/widgets/staff_tile.dart';

class DepartmentSearchScreen extends StatelessWidget {
  final Department deptType;
  final bool value;
  final String query;
  DepartmentSearchScreen(
      {super.key,
      required this.deptType,
      required this.value,
      required this.query});
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          value
              ? BlocProvider.of<DepartmentSearchCubit>(context)
                  .searchDepartmentsWithSearchBar(query, deptType)
              : BlocProvider.of<DepartmentSearchCubit>(context)
                  .searchDepartments('', deptType);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<DepartmentSearchCubit>(context).state;
    if (state.hasNext) {
      setupScrollController(context);
    }
    return BlocBuilder<DepartmentSearchCubit, DepartmentSearchState>(
      builder: (context, state) {
     
        return state.failureOrSuccess.fold(
            () => state.isFirstFetch
                ? const Center(
                    child: Text('Searching...'),
                  )
                : ListView.separated(
                    controller: state.hasNext ? scrollController : null,
                    itemBuilder: (context, index) {
                      if (index < state.staffs.length) {
                        return StaffTile(staff: state.staffs[index]);
                      } else {
                        Timer(const Duration(milliseconds: 30), () {
                          if (scrollController.hasClients) {
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          }
                        });

                        return _loadingIndicator();
                      }
                    },
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: state.staffs.length + (state.isLoading ? 1 : 0),
                  ), (success) {
          return success.fold((failure) {
            return const Center(
              child: Text('Error'),
            );
          }, (staffs) {
            return staffs.isEmpty
                ? const Center(
                    child: Text('No results'),
                  )
                : ListView.separated(
                    controller: state.hasNext ? scrollController : null,
                    itemBuilder: (context, index) {
                      if (index < staffs.length) {
                        return StaffTile(staff: staffs[index]);
                      } else {
                        Timer(const Duration(milliseconds: 30), () {
                          if (scrollController.hasClients) {
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          }
                        });

                        return _loadingIndicator();
                      }
                    },
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: staffs.length + (state.isLoading ? 1 : 0),
                  );
          });
        });
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
