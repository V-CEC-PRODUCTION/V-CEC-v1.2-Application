import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';
import 'package:vcec/presentation/notification/widgets/bubble_notif_widget.dart';
import 'dart:math';

import 'package:vcec/presentation/notification/widgets/notification_title.dart';
import 'package:vcec/presentation/notification/widgets/notifications_group_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 55.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Clear All',
                          style:
                              TextStyle(fontSize: 17.w, color: Colors.black38),
                        )),
                    kwidth10
                  ],
                )
              ],
            ),
            Column(
              children: [
                kheight20,
                kheight5,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kwidth20,
                    NotificationTitle(title: 'Recent notifications'),
                    Padding(
                      padding: EdgeInsets.only(top: 3.w, bottom: 18.w),
                      child: BubbleNotificationWidget(),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                          radius: 10.w,
                          backgroundColor: auththeme,
                          child: ThickerCloseIcon()),
                    ),
                    kwidth20
                  ],
                ),
                kheight15,
                NotificationsGroupWidget(
                  length: 5,
                  title: 'Today',
                ),
                NotificationsGroupWidget(
                  length: 5,
                  title: 'Yesterday',
                ),
                NotificationsGroupWidget(
                  length: 5,
                  title: 'This week',
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class ThickerCloseIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(12.w, 12.w), // Set the size of the icon
      painter: CloseIconPainter(), // Custom painter for the close icon
    );
  }
}

class CloseIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white // Icon color
      ..strokeWidth = 3.0 // Increase the stroke width for thickness
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final double offset =
        radius / sqrt(2); // Distance from the center to a corner

    final Path path = Path();
    path.moveTo(centerX - offset, centerY - offset);
    path.lineTo(centerX + offset, centerY + offset);
    path.moveTo(centerX - offset, centerY + offset);
    path.lineTo(centerX + offset, centerY - offset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
