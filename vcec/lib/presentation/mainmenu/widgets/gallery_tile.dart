import 'package:flutter/material.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/strings/strings.dart';

buildGalleryItem(
    {required int id,
    required String imageUrl,
    required String thumbnailUrl,
    required String tag}) {
  return Stone(
    id: id,
    child: Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ProgressiveImage(
            blur: 1,
            fit: BoxFit.cover,
            placeholder: null,
            thumbnail: NetworkImage(baseUrl + thumbnailUrl),
            image: NetworkImage(baseUrl + imageUrl),
            width: double.infinity,
            height: double.infinity,
          ),
          tag != 'img'
              ? Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    ),
    width: _width(id),
    height: 2,
  );
}

int _width(int x) {
  int y;
  if (x == 0) {
    y = 3;
  } else if (x % 4 == 0 || (x + 1) % 4 == 0) {
    y = 3;
  } else {
    y = 2;
  }
  return y;
}
