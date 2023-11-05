import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcec/presentation/mainmenu/widgets/story_data.dart';
import 'package:vcec/presentation/mainmenu/subpages/story_screen.dart';

import '../models/user_model.dart';

List<bool> isStoryViewed = List.generate(users.length, (index) => false);

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  ValueNotifier<int> selectedProfileIndex = ValueNotifier(users.length);

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
                  ),
                ));

                selectedProfileIndex.value = index;
                isStoryViewed[index] = true;
              },
              child: Hero(
                tag: user.name,
                child: ValueListenableBuilder<int>(
                  valueListenable: selectedProfileIndex,
                  builder: (context, value, child) {
                    Color borderColor = index == value || isStoryViewed[index]
                        ? Colors.transparent
                        : Colors.pink;

                    return Container(
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 2),
                        image: DecorationImage(
                          image: NetworkImage(user.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
