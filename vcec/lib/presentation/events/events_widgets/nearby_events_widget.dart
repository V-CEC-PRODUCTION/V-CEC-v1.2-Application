import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/events/constant.dart';

class NearbyEventsWidget extends StatelessWidget {
  const NearbyEventsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubHeading(text: 'Nearby Events'),
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
                      thumpnailUrl: commonimg,
                      imgUrl: commonimg,
                      title: eventname,
                      subtitle: description,
                      date: commondate,
                      time: commontime,
                    )),
          ),
        ),
      ],
    );
  }
}
