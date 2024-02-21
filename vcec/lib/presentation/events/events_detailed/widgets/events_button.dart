import 'package:flutter/material.dart';

class EventsButtonWidget extends StatelessWidget {
  const EventsButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: const Color.fromARGB(255, 39, 38, 38),
        ),
        child: child);
  }
}
