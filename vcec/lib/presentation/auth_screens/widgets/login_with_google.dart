import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/application/user/user_cubit.dart';
import 'package:vcec/core/constants.dart';

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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                ),
              ),
            ),
            width: 25.w,
            height: 25.w,
          ),
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
