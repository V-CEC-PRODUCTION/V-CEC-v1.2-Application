import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.url});
  final String url;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController videoPlayerController;

  final bool looping = false;
  final bool autoplay = true;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
   
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoInitialize: true,
      autoPlay: autoplay,
      aspectRatio: videoPlayerController.value.aspectRatio,
      looping: looping,
      placeholder:const Center(child: CircularProgressIndicator()),
      errorBuilder: (context, errorMessage) {
        return const Center(
          child: Text(
            "Something went wrong",
            style: TextStyle(color: Colors.white54),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
