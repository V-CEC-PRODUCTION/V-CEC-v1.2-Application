import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.obtext,
    required this.controller1,
  });

  final ValueNotifier<bool> obtext;
  final TextEditingController controller1;

  void passwordVisibility() {
    obtext.value = !obtext.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ValueListenableBuilder<bool>(
              valueListenable: obtext,
              builder: (context, value, child) {
                return TextFormField(
                  controller: controller1,
                  obscureText: !value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        passwordVisibility();
                      },
                      icon:
                          Icon(value ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
