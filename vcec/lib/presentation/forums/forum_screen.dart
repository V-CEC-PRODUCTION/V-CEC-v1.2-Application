import 'package:flutter/material.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/appbar_with_search.dart';
import 'package:vcec/presentation/forums/widgets/announcments_forum_widget.dart';
import 'package:vcec/presentation/forums/widgets/previous_events_widget.dart';
import 'package:vcec/presentation/forums/widgets/upcoming_events_widget.dart';

class ForumScreen extends StatelessWidget {
  ForumScreen({super.key, required this.name, this.imgUrl});
  final String name;
  final String? imgUrl;

  final ValueNotifier<bool> isSearchingNotifier = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWithSearch(
          hintText: 'Find Events', isSearchNotifier: isSearchingNotifier),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UpcomingEventsWidget(),
            kheight10,
            AnnouncementsEventsWidget(),
            kheight10,
            PreviousEventsWidget()
          ],
        ),
      )),
    );
  }
}
