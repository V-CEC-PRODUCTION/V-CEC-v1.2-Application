import 'package:flutter/material.dart';

import 'package:progressive_image/progressive_image.dart';

import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/common_widgets/notification_icon.dart';
import 'package:vcec/presentation/events/events_widgets/announcments_widget.dart';
import 'package:vcec/presentation/events/events_widgets/find_amazing_events_widget.dart';
import 'package:vcec/presentation/events/events_widgets/forum_event_filter_widget.dart';
import 'package:vcec/presentation/events/events_widgets/upcoming_events.dart';
import 'package:vcec/strings/strings.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({
    super.key,
    this.imgUrl,
  });
  final String? imgUrl;
  final String? imageUrl = AuthTokenManager.instance.imageUrl;
  final String? thumbnailUrl = AuthTokenManager.instance.thumbnailUrl;
  final String? name = AuthTokenManager.instance.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eventsappbarcolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 20,
            child: (thumbnailUrl) == null
                ? const CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(
                        'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                  )
                : _Banner(imageUrl: imageUrl!, thumbnailUrl: thumbnailUrl!),
          ),
        ),
        title: name == null
            ? const SizedBox()
            : Text(
                name!,
                style:
                    const TextStyle(color: kwhite, fontWeight: FontWeight.bold),
              ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
              child: NotificationIcon(),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FindAmazingEventsWidget(),
            kheight10,
            const ForumEventFilterWidget(),
            const UpcomingEvents(),
            // const EventsForYouWidget(),
            const AnnouncementsEventsWidget(),
            kheight10,
            //     const LatestNewsWidget(),
          ],
        ),
      )),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.imageUrl, required this.thumbnailUrl});
  final String imageUrl;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    String url = '$baseUrl$imageUrl'.replaceAll('auth//api/', 'auth/api/');
    String turl = '$baseUrl$thumbnailUrl'.replaceAll('auth//api/', 'auth/api/');
    return CircleAvatar(
      radius: 20,
      child: ClipOval(
        child: ProgressiveImage(
            blur: 1,
            fit: BoxFit.cover,
            placeholder: null,
            thumbnail: NetworkImage(turl),
            image: NetworkImage(url),
            width: double.infinity,
            height: double.infinity),
      ),
    );
  }
}
