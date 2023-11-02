import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/sign_up.png'), fit: BoxFit.fitWidth),
      ),
      height: 450.h,
      width: double.infinity,
    );
  }
}
