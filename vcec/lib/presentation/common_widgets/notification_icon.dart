import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/colors.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.notifications_none_outlined,
      color: kwhite,
    );
  }
}
