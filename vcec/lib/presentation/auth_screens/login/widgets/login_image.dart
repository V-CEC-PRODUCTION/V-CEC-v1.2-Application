import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImageWidget extends StatelessWidget {
  const LoginImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/login_image.jpg'),
              fit: BoxFit.fitWidth),
        ),
        height: 480.w,
        width: 480.w,
      ),
    );
  }
}
