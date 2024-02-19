import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vcec/core/constants.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:vcec/domain/departments/search/staff/staff_info.dart';

class StaffTile extends StatelessWidget {
  StaffTile({super.key, required this.staff});
  final Staff staff;
  final color = Color.fromRGBO(80, 82, 86, 1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(-7, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(110, 139, 118, 1),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                    offset: Offset(3, 3),
                    spreadRadius: 3,
                    blurRadius: 15,
                  ),
                ],
              ),
              height: 76,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            height: 80,
            child: Row(
              children: [
                kwidth10,
                ProfilePicture(
                  name: staff.name!,
                  radius: 25,
                  fontsize: 20,
                  random: false,
                ),
                kwidth10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        staff.name!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                      AutoSizeText(
                        staff.designation!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: color,
                      width: 1,
                    ),
                  ),
                  child: Center(
                      child: IconButton(
                    icon: Icon(
                      Icons.call,
                      color: color,
                      size: 13,
                    ),
                    onPressed: () {
                      _makePhoneCall(number: staff.mobileNo.toString());
                    },
                  )),
                ),
                kwidth10,
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color.fromARGB(120, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.mail,
                        color: color,
                        size: 13,
                      ),
                      onPressed: () {
                        _sendEmail(email: staff.emailId!);
                      },
                    ),
                  ),
                ),
                kwidth10,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall({required String number}) async {
    final phoneNumber = '+91$number';
    final encodedPhoneNumber = Uri.encodeFull('tel:$phoneNumber');
    try {
      if (await canLaunchUrlString(encodedPhoneNumber)) {
        await launchUrlString(encodedPhoneNumber);
      } else {
        throw 'Could not launch $encodedPhoneNumber';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _sendEmail({required String email}) async {
    final emailId = email.trim();
    final subject = 'Subject';
    final body = 'Hello this is the body of your mail';
    final url = 'mailto:$emailId?subject=$subject&body=$body'
        '&package=com.google.android.gm';
    try {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

class SearchData {
  String searchText;
  bool isNotEmpty;

  SearchData({required this.searchText, required this.isNotEmpty});
}
