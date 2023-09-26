import 'package:flutter/material.dart';

class NotificationSubtitleWidget extends StatelessWidget {
  const NotificationSubtitleWidget({super.key, required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return  Text(title);
  }
}
