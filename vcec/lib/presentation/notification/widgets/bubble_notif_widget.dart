import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleNotificationWidget extends StatelessWidget {
  const BubbleNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 3.w,
      backgroundColor: Colors.blue[800],
    );
  }
}
