import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/departments/widgets/staff_tile.dart';

class DepartmentSearchScreen extends StatelessWidget {
  const DepartmentSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentSearchCubit, DepartmentSearchState>(
      builder: (context, state) {
        return state.failureOrSuccess.fold(
            () => const Center(
                  child: Text('Searching...'),
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
                    itemBuilder: (context, index) =>
                        StaffTile(staff: staffs[index]),
                    separatorBuilder: (context, index) => kheight20,
                    itemCount: staffs.length,
                  );
          });
        });
      },
    );
  }
}
