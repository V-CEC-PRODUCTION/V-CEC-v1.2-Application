import 'package:flutter/material.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/departments/a_department_screen.dart';

class DepartmentsIdleScreen extends StatelessWidget {
  DepartmentsIdleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubHeading(text: 'DEPARTMENTS'),
        kheight20,
        Expanded(child: _DeptGrid(itemCount: 5)),
      ],
    );
  }
}

class _DeptGrid extends StatelessWidget {
  final int itemCount;
  late final int noRows;
  final deps = [
    {
      'path': 'assets/img/deps/cs.png',
      'name': 'Computer Science',
      'short_name': 'CS',
      'dept': Department.cs
    },
    {
      'path': 'assets/img/deps/ec.png',
      'name': 'Electronics & Commmunication',
      'short_name': 'EC',
      'dept': Department.ec
    },
    {
      'path': 'assets/img/deps/eee.png',
      'name': 'Electrical Engineering',
      'short_name': 'EEE',
      'dept': Department.eee
    },
    {
      'path': 'assets/img/deps/asc.png',
      'name': 'Applied Science',
      'short_name': 'Applied Science',
      'dept': Department.as
    },
    {
      'path': 'assets/img/deps/gs.png',
      'name': 'General Science',
      'short_name': 'General Science',
      'dept': Department.gs
    },
    {
      'path': 'assets/img/deps/gs.png',
      'name': 'Library',
      'short_name': 'Library',
      'dept': Department.lib
    },
  ];
  _DeptGrid({Key? key, required this.itemCount}) {
    noRows = (itemCount / 2).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (i * 2 < deps.length) ...[
                  _DeptTile(dept: deps[i * 2]),
                ],
                if (i * 2 + 1 < deps.length) ...[
                  _DeptTile(dept: deps[i * 2 + 1]),
                ],
                if (i == noRows - 1 &&
                    itemCount.isOdd &&
                    i * 2 + 2 < deps.length)
                  _DeptTile(dept: deps[i * 2 + 2]),
              ],
            ),
        separatorBuilder: (context, index) => SizedBox(height: 30),
        itemCount: itemCount);
  }
}

class _DeptTile extends StatelessWidget {
  const _DeptTile({
    super.key,
    required this.dept,
  });
  final Map dept;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ADepartmentScreen(deptType: dept['dept'], department: dept['name']),
      )),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                blurRadius: 9,
                spreadRadius: 8,
                offset: const Offset(0, 0),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dept['short_name'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
            Image.asset(dept['path']),
          ],
        ),
      ),
    );
  }
}
