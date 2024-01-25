import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
        appBar: AppBar(),
        body: SafeArea(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(35, 55, 35, 55),
                  child: Container(
                    height: _controller.value.size.height,
                    width: _controller.value.size.width,
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ));
  }
}
