import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';


import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/mainmenu/widgets/story_data.dart';

import 'package:vcec/presentation/mainmenu/widgets/story_screen.dart';

import '../models/user_model.dart';

class StoryPart extends StatelessWidget {
  const StoryPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth10,
        Container(
          height: 40,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 54, 54, 54),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              'Forums',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        kwidth10,
        StoryWidget()
      ],
    );
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final User user = users[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StoryScreen(
                            stories: user.stories,
                            userPageIndex: index,
                          )));
                },
                child: Container(
                  width: 65,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(user.profileImageUrl),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
