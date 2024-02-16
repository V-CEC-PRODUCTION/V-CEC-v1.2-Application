import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/widgets/carousel.dart';

class AnnouncementsEventsWidget extends StatelessWidget {
  const AnnouncementsEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeading(text: 'Announcements'),
            TextButton(
                onPressed: () {},
                child: Text('View All',
                    style: TextStyle(
                      color: kBlackBlurr,
                    )))
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              5,
              (index) => EventsCardWidget(
                    thumpnailUrl: image[0],
                    pimgUrl: image[0],
                    title:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                    subtitle:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful conten ',
                  )),
        ),
      )
    ]);
  }
}
