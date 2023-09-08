import 'package:flutter/cupertino.dart';

class TitleDetails extends StatelessWidget {
  final String name;
  final double fontsize;
  const TitleDetails({
    super.key,
    required this.name,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.bold),
    );
  }
}
