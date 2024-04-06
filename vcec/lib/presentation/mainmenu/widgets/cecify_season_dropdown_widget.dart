import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/cecify/cecify_cubit.dart';
import 'package:vcec/core/colors.dart';

class CecifySeasonDropDownWidget extends StatelessWidget {
  CecifySeasonDropDownWidget({
    super.key,
    required this.selectedSeason,
    required this.seasonLength,
  });
  final ValueNotifier<String> selectedSeason;
  final int seasonLength;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedSeason,
      builder: (context, value, child) {
        return DropdownButton(
          iconEnabledColor: kwhite,
          value: selectedSeason.value,
          underline: Container(),
          elevation: 0,
          dropdownColor: Color.fromARGB(93, 3, 3, 3),
          items: [
            for (int i = 1; i <= seasonLength; i++)
              DropdownMenuItem<String>(
                value: 'Season $i',
                child: Text(
                  'Season $i',
                  style: TextStyle(color: kwhite, fontSize: 18.w),
                ),
              ),
          ],
          onChanged: (String? value) {
            selectedSeason.value = value!;
            BlocProvider.of<CecifyCubit>(context).getEpisodes(
              int.parse(value.split(' ')[1]),
            );
          },
        );
      },
    );
  }
}
