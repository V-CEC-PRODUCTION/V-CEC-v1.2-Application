import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/cec_times/widgets/cec_times_event_tile.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class CecTimesListWidget extends StatelessWidget {
  const CecTimesListWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 13),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
        ),
        Column(
          children: List.generate(
            3,
            (index) => CecTimesTileWidget(
              imageUrl: image[index % 3],
              color: kwhite,
              textColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
