import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/common_widgets/rec_event_tile.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeading(text: 'Latest News'),
              TextButton(
                  onPressed: () {},
                  child: Text('View All',
                      style: TextStyle(
                        color: kBlackBlurr,
                      )))
            ],
          ),
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
