import 'package:flutter/material.dart';

class SettingsFieldWidget extends StatelessWidget {
  const SettingsFieldWidget(
      {super.key,
      required this.size1,
      required this.icon,
      required this.text,
      required this.onPress});

  final double size1;
  final IconData icon;
  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size1 * 0.1, right: size1 * 0.09),
      child: Column(
        children: [
          ListTile(
            onTap: onPress,
            leading: Icon(icon),
            title: Padding(
              padding: EdgeInsets.only(left: size1 * 0.06),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            width: size1 * 0.8,
            height: 1,
            decoration: const BoxDecoration(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
