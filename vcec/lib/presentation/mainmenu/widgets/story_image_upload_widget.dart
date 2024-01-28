import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';
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
        // uri is the local path of final render Uint8List
        // here your code
        print(uri);
        Share.shareFiles([uri]);
      },
      middleBottomWidget: SizedBox(),
    );
  }
}
