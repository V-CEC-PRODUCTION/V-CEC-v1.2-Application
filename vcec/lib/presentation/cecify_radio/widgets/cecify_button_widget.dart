import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CecifyButtonWidget extends StatelessWidget {
  const CecifyButtonWidget(
      {super.key,
      required this.title,
      required this.url,
      required this.launchurl});
  final String title;
  final String url;
  final String launchurl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        launchUrl(Uri.parse(launchurl));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Image.asset(
                  url,
                  width: 25.w, // adjust the width as desired
                  // height: 50.w, // adjust the height as desired
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
