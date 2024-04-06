import 'package:flutter/material.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_swipe_view.dart';

buildGalleryItem(
    {required int id,
    required String imageUrl,
    required String thumbnailUrl,
    required String tag,
    required BuildContext context}) {
  return Stone(
    id: id,
    width: _width(id),
    height: 2,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GallerySwipeView(
              offset: id,
            ),
          ),
        );
      },
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
              thumbnail: NetworkImage(thumbnailUrl),
              image: NetworkImage(imageUrl),
              width: double.infinity,
              height: double.infinity,
            ),
            tag != 'img'
                ? Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    ),
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
