import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/notification/widgets/bubble_notif_widget.dart';
import 'package:vcec/presentation/notification/widgets/notification_subtitle.dart';
import 'package:vcec/presentation/notification/widgets/notification_title.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10.w),
        constraints: BoxConstraints(minHeight: 55.w),
        decoration: BoxDecoration(
          color: Color.fromARGB(47, 159, 197, 232),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 50.w,
                width: 45.w,
                child: Center(child: BubbleNotificationWidget())),
            SizedBox(
              width: 210.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationTitle(title: 'Recent notifications '),
                    // NotificationSubtitleWidget(title: 'Hello everyone')
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            NotificationSubtitleWidget(title: 'Just now'),
            kwidth10
          ],
        ));
  }
}
