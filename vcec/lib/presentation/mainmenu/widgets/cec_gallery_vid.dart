import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_tile.dart';

class GalleryTabVid extends StatelessWidget {
  const GalleryTabVid({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<GalleryCubit>(context).getGalleryImages();
    });
    return BlocBuilder<GalleryCubit, GalleryState>(builder: (context, state) {
      final filteredGalleryFiles = state.galleryfiles!
          .where(
            (element) => element.tag == 'vid',
          )
          .toList();
      return WallLayout(
        layersCount: 5,
        stones: List.generate(
          filteredGalleryFiles.length,
          (index) => buildGalleryItem(
              context: context,
              id: index,
              tag: filteredGalleryFiles[index].tag!,
              imageUrl: filteredGalleryFiles[index].mediaUrl!,
              thumbnailUrl: filteredGalleryFiles[index].thumbnailUrl!),
        ),
      );
    });
  }
}
