import 'package:flutter/material.dart';

class TimeDateVenueTextWidget extends StatelessWidget {
  const TimeDateVenueTextWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
