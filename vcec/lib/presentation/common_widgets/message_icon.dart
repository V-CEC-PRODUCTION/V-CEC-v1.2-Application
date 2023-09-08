import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/colors.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.chat_bubble_2,
      color: kwhite,
    );
  }
}
