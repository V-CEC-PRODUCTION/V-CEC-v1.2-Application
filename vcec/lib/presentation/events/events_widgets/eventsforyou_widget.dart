import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/common_widgets/rec_event_tile.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class EventsForYouWidget extends StatelessWidget {
  const EventsForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0, top: 13),
          child: SubHeading(text: 'Events For You'),
        ),
        Column(
          children: List.generate(
            5,
            (index) => RecEventTile(
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
