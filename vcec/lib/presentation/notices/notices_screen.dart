import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/notices/widgets/notices_tabbar.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({Key? key, this.imgUrl});

  final String name = 'Riya';
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.width * .35 * 518 / 1019),
        child: AppBar(
          backgroundColor: eventsappbarcolor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: CircleAvatar(
              child: imgUrl != null ? Image.network(imgUrl!) : Text(name[0]),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '12-3-2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  children: [
                    Text(
                      'Get Notified!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '52 unnoticed notifications',
                      style: TextStyle(color: Colors.white, fontSize: 12.5),
                    ),
                  ],
                ),
              ),
            ),
            kwidth20,
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14),
            child: SubHeading(text: 'Notices'),
          ),
          Expanded(child: NoticesTabbar())
        ],
      ),
    );
  }
}
