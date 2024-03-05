import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/cecify_radio/widgets/cecify_title_section_widget.dart';
import 'package:vcec/presentation/cecify_radio/widgets/episodes_list_widget.dart';

class CecifyRadioScreen extends StatelessWidget {
  const CecifyRadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CecifyTitleSectionWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 11.w),
              child: Text(
                "CECify presents, CEC's own podcasts, for all CECians College of Engineering, Chengannnur",
                textAlign: TextAlign.center,
                style: TextStyle(color: kblack, fontSize: 16.w),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0.w),
              child: Text(
                'All Episodes',
                style: TextStyle(
                    color: kblack, fontSize: 29.w, fontWeight: FontWeight.bold),
              ),
            ),
            EpisodesListWidget(),
            kheight10,
          ],
        ),
      ),
    );
  }
}
