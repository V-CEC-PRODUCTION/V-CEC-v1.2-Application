import 'package:flutter/material.dart';

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({super.key, required this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
