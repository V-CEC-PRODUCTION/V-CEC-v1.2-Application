import 'package:flutter/widgets.dart';

class AuthPageTitle extends StatelessWidget {
  final String name;
  final double fontsize;
  const AuthPageTitle({
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
