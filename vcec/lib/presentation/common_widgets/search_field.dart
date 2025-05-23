import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/departments/rsearch/department_search_cubit.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/departments/widgets/staff_tile.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.hintText,
      required this.isSearchNotifier,
      required this.deptType});
  final Department? deptType;
  final String hintText;
  final ValueNotifier isSearchNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          print('searching for $value');
          BlocProvider.of<DepartmentSearchCubit>(context)
              .searchDepartmentsWithSearchBar(
            value,
            deptType,
            false
          );

          if (value.isNotEmpty) {
            isSearchNotifier.value =
                SearchData(searchText: value, isNotEmpty: true);

            isSearchNotifier.notifyListeners();
          } else {
            isSearchNotifier.value =
                SearchData(searchText: '', isNotEmpty: false);
            isSearchNotifier.notifyListeners();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 110, 110, 110),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 110, 110, 110),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 110, 110, 110),
              width: 1,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
