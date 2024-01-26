import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcec/presentation/mainmenu/widgets/story_video_text_editor_widget.dart';
import 'package:video_player/video_player.dart';

class StoryVideoUploadWidget extends StatefulWidget {
  final String path;
  const StoryVideoUploadWidget({super.key, required this.path});

  @override
  State<StoryVideoUploadWidget> createState() => _StoryVideoUploadWidgetState();
}

class _StoryVideoUploadWidgetState extends State<StoryVideoUploadWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.path,
      ),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Icon(Icons.send),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Stack(children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    height: _controller.value.size.height,
                    width: _controller.value.size.width,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.5))),
                  IconButton(
                    onPressed: () {
                      StoryVideoTextEditor();
                    },
                    icon: Icon(
                      CupertinoIcons.textformat,
                      size: 30,
                      color: Colors.white,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            StoryVideoTextEditor()
          ]),
        ));
  }
}
