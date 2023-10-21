import 'package:flutter/material.dart';

class AccountTextFieldWidget extends StatelessWidget {
  const AccountTextFieldWidget({super.key, required this.name,  this.controller});
  final String name;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 63 / 470,
          right: MediaQuery.of(context).size.width * 48.31 / 470),
      child: TextField(
        controller:controller ,
        decoration: InputDecoration(
          labelText: "* $name",
        ),
        maxLines: 1,
      ),
    );
  }
}
