import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/notification/widgets/notification_tile_widget.dart';

class NotificationsGroupWidget extends StatelessWidget {
  const NotificationsGroupWidget({super.key, required this.length, this.title});
  final length;
  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.w,
                color: Colors.black38),
          ),
          kheight5,
          Column(
            children: List.generate(5, (index) => const NotificationTileWidget()),
          ),
        ],
      ),
    );
  }
}
