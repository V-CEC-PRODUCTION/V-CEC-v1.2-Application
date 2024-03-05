import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';

class CecifyTitleSectionWidget extends StatelessWidget {
  const CecifyTitleSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.red,
              Colors.yellow,
              Colors.blue,
              Colors.green
            ],
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'COLLEGE OF ENGINEERING CHENGANNUR',
              style: TextStyle(color: kwhite, fontSize: 12),
            ),
            kheight30,
            Text(
              'CECify',
              style: TextStyle(
                  color: kwhite, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'get cecfied',
              style: TextStyle(color: kwhite, height: -0.01, fontSize: 12),
            ),
            kheight30,
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.521),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Season 2',
                  style: TextStyle(color: kwhite, height: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
