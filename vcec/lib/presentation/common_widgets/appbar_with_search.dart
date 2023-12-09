import 'package:flutter/material.dart';

import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/avatar.dart';
import 'package:vcec/presentation/common_widgets/notification_icon.dart';
import 'package:vcec/presentation/common_widgets/search_field.dart';

enum Department { cs, ec, eee, gs, as, lib }

class AppbarWithSearch extends PreferredSize {
  final String hintText;
  final ValueNotifier isSearchNotifier;
  final Department? department;
  AppbarWithSearch({
    super.key,
    required this.isSearchNotifier,
    required this.hintText,
    this.department,
  }) : super(
          preferredSize: const Size(double.infinity, 150),
          child: SizedBox.expand(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 125,
                  color: Color.fromARGB(255, 40, 40, 40),
                  child: Row(
                    children: [
                      kwidth20,
                      Avatar(),
                      kwidth20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '12-3-2023',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Riya',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      NotificationIcon(),
                      kwidth10,
                      kwidth20,
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 100),
                  child: SearchField(
                    hintText: hintText,
                    isSearchNotifier: isSearchNotifier,
                    deptType: department,
                  ),
                )
              ],
            ),
          ),
        );
}
