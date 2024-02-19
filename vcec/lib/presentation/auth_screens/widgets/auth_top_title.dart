import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/presentation/auth_screens/otp_verification/otp_verification_screen.dart';

class AuthTopTitleWidget extends StatelessWidget {
  const AuthTopTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          color: auththeme),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 45.w, fontFamily: 'Inter', fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
