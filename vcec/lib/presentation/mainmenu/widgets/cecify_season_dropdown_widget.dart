import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';

const List<String> SeasonLabel = [
  'Season 1',
  'Season 2',
  'Season 3',
  'Season 4'
];

class CecifySeasonDropDownWidget extends StatelessWidget {
  CecifySeasonDropDownWidget({
    super.key,
    required this.selectedSeason,
  });
  final ValueNotifier<String> selectedSeason;

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
          items: SeasonLabel.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: kwhite, fontSize: 18.w),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            selectedSeason.value = value!;
          },
        );
      },
    );
  }
}
