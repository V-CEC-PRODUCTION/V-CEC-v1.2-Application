import 'package:flutter/material.dart';

class EmailPassWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const EmailPassWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: text),
          ),
        ),
      ],
    );
  }
}
