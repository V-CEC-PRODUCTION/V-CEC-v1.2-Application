import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/common_widgets/rec_event_tile.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class CecToday extends StatelessWidget {
  const CecToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) => RecEventTile(
          imageUrl: image[index % 3],
          color: kwhite,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
