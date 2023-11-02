import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

displaySnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
