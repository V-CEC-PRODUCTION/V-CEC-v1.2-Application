import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 150.w,
          height: 1.h,
          color: Colors.grey,
        ),
        const Text(
          'OR',
          style: TextStyle(
            color: Color.fromARGB(255, 133, 131, 131),
          ),
        ),
        Container(
          width: 150.w,
          height: 1.h,
          color: Colors.grey,
        ),
      ],
    );
  }
}
