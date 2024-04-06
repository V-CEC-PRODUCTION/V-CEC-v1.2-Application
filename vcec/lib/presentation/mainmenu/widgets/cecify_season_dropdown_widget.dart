import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/cecify/cecify_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/cecify/color/color_model.dart';

class CecifySeasonDropDownWidget extends StatelessWidget {
  CecifySeasonDropDownWidget({
    super.key,
    required this.selectedSeason,
    required this.seasonLength, required this.colors,
  });
  final ValueNotifier<String> selectedSeason;
  final int seasonLength;
  final List<ColorResult> colors;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedSeason,
      builder: (context, value, child) {
        print(value + 'hi');
        return DropdownButton(
          iconEnabledColor: kwhite,
          value: selectedSeason.value,
          underline: Container(),
          elevation: 0,
          dropdownColor: Color.fromARGB(93, 3, 3, 3),
          items: List<DropdownMenuItem<String>>.generate(
            seasonLength,
            (int index) => DropdownMenuItem<String>(
              value: 'Season ${colors[index].season}',
              child: Text(
                'Season ${colors[index].season}',
                style: TextStyle(color: kwhite, fontSize: 18.w),
              ),
            ),
          ),
          onChanged: (String? value) {
            if (value != null) {
              log('hinidhin');
              print(value);
              selectedSeason.value = value;
              BlocProvider.of<CecifyCubit>(context).getEpisodes(
                int.parse(value.split(' ')[1]),
              );
            }
          },
        );
      },
    );
  }
}
