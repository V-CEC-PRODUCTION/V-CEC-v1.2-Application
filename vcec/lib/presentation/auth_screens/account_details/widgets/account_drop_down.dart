import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';

class AccountDropDownWidget extends StatelessWidget {
  AccountDropDownWidget(
      {super.key, required this.title, required this.dropdownItems});

  final String title;

  final ValueNotifier<String?> selectedValueNotifier =
      ValueNotifier<String?>(null);

  final List<DropdownMenuItem<String>> dropdownItems;

  String getSelectedValue() {
    return selectedValueNotifier.value ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedValueNotifier,
      builder: (context, selectedValue, _) {
        return DropdownButton(
          style: const TextStyle(
              fontSize: 16, color: kblack, overflow: TextOverflow.ellipsis),
          items: dropdownItems,
          onChanged: (value) {
            selectedValueNotifier.value = value;
          },
          value: selectedValue,
          hint: Text(title),
        );
      },
    );
  }
}
