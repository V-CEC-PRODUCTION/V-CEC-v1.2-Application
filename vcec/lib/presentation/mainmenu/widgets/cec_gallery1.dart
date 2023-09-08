import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_tile.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<GalleryCubit>(context).getGalleryImages();
    });
    return BlocBuilder<GalleryCubit, GalleryState>(builder: (context, state) {
      return WallLayout(
        layersCount: 5,
        stones: List.generate(
          state.galleryfiles!.length,
          (index) => buildGalleryItem(
              id: index,
              tag: state.galleryfiles![index].tag!,
              imageUrl: state.galleryfiles![index].mediaUrl!,
              thumbnailUrl: state.galleryfiles![index].thumbnailUrl!),
        ),
      );
    });
  }
}
