import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, this.image});
  Image? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundImage: image!.image,
    );
  }
}
