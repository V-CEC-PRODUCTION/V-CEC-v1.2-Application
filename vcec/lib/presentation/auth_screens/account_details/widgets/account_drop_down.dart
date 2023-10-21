import 'package:flutter/material.dart';

class AccountDropDownWidget extends StatelessWidget {
  AccountDropDownWidget({Key? key, required this.title, required this.dropdownItems})
      : super(key: key);

  final String title;

  final ValueNotifier<String?> selectedValueNotifier = ValueNotifier<String?>(null);

  List<DropdownMenuItem<String>> dropdownItems;

  String getSelectedValue() {
    return selectedValueNotifier.value ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedValueNotifier,
      builder: (context, selectedValue, _) {
        return DropdownButton(
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
