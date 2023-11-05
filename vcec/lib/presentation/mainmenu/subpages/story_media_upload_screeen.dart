import 'dart:io';

import 'package:flutter/material.dart';

import 'package:vcec/presentation/mainmenu/widgets/story_floating_text.dart';
import 'package:video_player/video_player.dart';

import '../models/story_model.dart';

class UploadMedia extends StatefulWidget {
  File? media;
  MediaType? source;
  UploadMedia({required this.media, required this.source});

  @override
  State<UploadMedia> createState() => _UploadMediaState();
}

class _UploadMediaState extends State<UploadMedia> {
  late VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(widget.media!)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller!.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.grey[900],
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              color: Colors.grey[900],
              child: widget.media != null
                  ? (widget.source == MediaType.image
                      ? Image.file(
                          widget.media!,
                          fit: BoxFit.contain,
                        )
                      : (_controller != null && _controller!.value.isInitialized
                          ? FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: _controller!.value.size.width,
                                height: _controller!.value.size.height,
                                child: VideoPlayer(_controller!),
                              ),
                            )
                          : Icon(Icons.videocam_off)))
                  : Icon(Icons.image_not_supported_rounded),
            ),
            MovingText()
          ],
        ));
  }
}

Widget floatingActionButton = FloatingActionButton(
    backgroundColor: Colors.grey[800],
    onPressed: () {},
    child: Icon(
      Icons.file_upload_outlined,
      color: Colors.white,
      size: 40,
    ));
