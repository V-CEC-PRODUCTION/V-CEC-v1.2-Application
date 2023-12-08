import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const EmailTextField({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.controller,
    this.validator,
    this.autovalidateMode,
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
            controller: controller,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
