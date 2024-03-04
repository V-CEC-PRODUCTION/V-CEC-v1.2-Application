import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';
import 'package:vcec/presentation/mainmenu/mainmenu_screen.dart';
//import 'package:stories_editor/stories_editor.dart';

class StoryImageUploadWidget extends StatefulWidget {
  const StoryImageUploadWidget({super.key});

  @override
  State<StoryImageUploadWidget> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryImageUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return StoriesEditor(
      giphyKey: '3tKgbOFuFHMlzPYqJi6jH5cev6N9KFsQ',
      onDone: (uri) {
        myUri = uri;
        log('myUri: $myUri');
        Navigator.pop(context);
        Navigator.pop(context);
      },
      middleBottomWidget: const SizedBox(),
    );
  }
}
