import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/events/constant.dart';

class ForumEventFilterWidget extends StatelessWidget {
  const ForumEventFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            print('object');
          },
          child: Text(
            'All',
            style: TextStyle(color: kwhite),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkGreen,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            minimumSize: Size(50, 28), // Adjust the height here
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                forumNames.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      return forumOnTap[index]();
                    },
                    child: Text(
                      '${forumNames[index]}',
                      style: TextStyle(color: kBlackBlurr, fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhite,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: Size(30, 28),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
