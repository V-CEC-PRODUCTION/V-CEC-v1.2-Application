import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';


class StoryUploadWidget extends StatefulWidget {
  const StoryUploadWidget({super.key});

  @override
  State<StoryUploadWidget> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryUploadWidget> {

  @override
  Widget build(BuildContext context) {
    return StoriesEditor(
      giphyKey: 'API KEY',
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
