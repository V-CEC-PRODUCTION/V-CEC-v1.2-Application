import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWithGoogleWidget extends StatelessWidget {
  const LoginWithGoogleWidget({
    super.key,
    required this.title,
    required this.onClick,
  });

  final String title;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: Color.fromARGB(255, 221, 218, 218),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Text(
              title,
              style: TextStyle(fontSize: 20.5.w, color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}
