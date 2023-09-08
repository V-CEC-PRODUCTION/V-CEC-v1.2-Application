import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ));
  }
}
