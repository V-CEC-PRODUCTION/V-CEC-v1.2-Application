import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/mainmenu/models/story_model.dart';
import 'package:vcec/presentation/mainmenu/subpages/story_media_upload_screeen.dart';

import 'package:vcec/presentation/mainmenu/widgets/story_widget.dart';

class StoryPart extends StatefulWidget {
  const StoryPart({super.key});

  @override
  State<StoryPart> createState() => _StoryPartState();
}

class _StoryPartState extends State<StoryPart> {
  File? media;
  MediaType? source;

  Future pickMedia(MediaType source) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? media;

      if (source == MediaType.image) {
        media = await _picker.pickImage(source: ImageSource.gallery);
      } else {
        media = await _picker.pickVideo(source: ImageSource.gallery);
      }

      if (media == null) {
        return null;
      }

      final File temperoryFile = File(media.path);
      setState(() {
        this.source = source;
        this.media = temperoryFile;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void _shoeBottomSheet() {
    bottomSheet(
      context,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () async {
                media = null;
                await pickMedia(MediaType.image);
                if (media != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UploadMedia(media: media, source: source)));
                }
              },
              icon: Icon(
                Icons.image,
                color: Colors.white,
                size: 50,
              )),
          IconButton(
              onPressed: () async {
                media = null;
                await pickMedia(MediaType.video);
                if (media != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UploadMedia(media: media, source: source)));
                }
              },
              icon: Icon(
                Icons.video_call_sharp,
                color: Colors.white,
                size: 50,
              ))
        ],
      ),
    );
  }

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
        GestureDetector(
          onTap: () {
            _shoeBottomSheet();
          },
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              color: Colors.pink,
              size: 35,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        kwidth10,
        StoryWidget()
      ],
    );
  }
}

bottomSheet(BuildContext context, Widget widget) {
  showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            height: 170,
            child: widget);
      });
}
