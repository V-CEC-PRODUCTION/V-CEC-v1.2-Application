import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/mainmenu/widgets/story_upload_widget.dart';

import 'package:vcec/presentation/mainmenu/widgets/story_user_widget.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({super.key});

  @override
  State<StoryWidget> createState() => _StoryPartState();
}

class _StoryPartState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth10,
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StoryUploadWidget()));
          },
          child: Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                child: Center(child: Text('Image')),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                top: 35,
                bottom: 0,
                left: 40,
                right: 3,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        size: 15,
                        Icons.add,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
        kwidth10,
        StoryUserWidget()
      ],
    );
  }
}
