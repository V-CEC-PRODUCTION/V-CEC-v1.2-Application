import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmPasswordTextFieldWidget extends StatelessWidget {
  const ConfirmPasswordTextFieldWidget({
    super.key,
    required this.controller1,
    required this.controller,
  });

  final TextEditingController controller1;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w, right: 23.w, top: 20.h),
      child: Row(
        children: [
          const Icon(
            Icons.lock_reset,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (value != controller.text) {
                  return 'Password must be same';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
