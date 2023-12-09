import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordTextFieldWidget extends StatelessWidget {
  const NewPasswordTextFieldWidget({
    super.key,
    required this.obtext,
    required this.controller,
  });

  final ValueNotifier<bool> obtext;
  final TextEditingController controller;

  void passwordVisibility() {
    obtext.value = !obtext.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w, right: 23.w, top: 140.h),
      child: Row(
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
                    obscureText: !value,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          passwordVisibility();
                        },
                        icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    controller: controller,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
