import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/cecify_radio/cecify_radio_screen.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_radio_episodes_horizontal_widget.dart';
import 'package:vcec/presentation/mainmenu/widgets/cecify_season_dropdown_widget.dart';

class CecifyRadioWidget extends StatelessWidget {
  CecifyRadioWidget({super.key});

  final bool isTileSelected = false;
  final ValueNotifier<String> selectedSeason = ValueNotifier(SeasonLabel.first);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.w),
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.25, 0.75, .9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xff0C4383),
              Color(0xff072166),
              Color(0xff071D63),
              Color(0xff0C4383),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CecifyRadioScreen()));
                    },
                    child: Text(
                      'CECify Radio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CecifySeasonDropDownWidget(
                    selectedSeason: selectedSeason,
                  )
                ],
              ),
            ),
            CecifyRadioEpisodesHorizontalWidget(),
            kheight20
          ],
        ),
      ),
    );
  }
}
