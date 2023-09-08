import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';

import 'package:vcec/presentation/common_widgets/message_icon.dart';
import 'package:vcec/presentation/common_widgets/notification_icon.dart';
import 'package:vcec/presentation/events/events_widgets/announcments_widget.dart';
import 'package:vcec/presentation/events/events_widgets/eventsforyou_widget.dart';
import 'package:vcec/presentation/events/events_widgets/find_amazing_events_widget.dart';
import 'package:vcec/presentation/events/events_widgets/forum_event_filter_widget.dart';
import 'package:vcec/presentation/events/events_widgets/latest_news_widget.dart';
import 'package:vcec/presentation/events/events_widgets/nearby_events_widget.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({super.key, this.imgUrl});
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eventsappbarcolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20,
            child: imgUrl != null ? Image.network(imgUrl!) : Text('A'),
          ),
        ),
        title: Text(
          'name',
          style: TextStyle(color: kwhite, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              color: appbarbuttonbackground,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
                child: NotificationIcon(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: appbarbuttonbackground,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, top: 2.5, bottom: 1.5),
                    child: MessageIcon()),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FindAmazingEventsWidget(),
            kheight10,
            ForumEventFilterWidget(),
            NearbyEventsWidget(),
            EventsForYouWidget(),
            AnnouncementsEventsWidget(),
            kheight10,
            LatestNewsWidget(),
          ],
        ),
      )),
    );
  }
}
