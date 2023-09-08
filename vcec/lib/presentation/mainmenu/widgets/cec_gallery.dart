import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_tile.dart';

class CecGallery extends StatelessWidget {
  const CecGallery({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<GalleryCubit>(context).getGalleryImages();
    });
    final size = MediaQuery.of(context).size;
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          state.failureOrSuccess.fold(
            () {},
            (either) => either.fold(
              (failure) {
                if (failure == const MainFailure.clientFailure()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No Internet Connection'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('server error'),
                    ),
                  );
                }
              },
              (success) {},
            ),
          );
        });
        return state.galleryfiles == null
            ? Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 0, 0, 0),
                highlightColor: Color.fromARGB(255, 207, 207, 207),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: (size.width - 20) * 9 / 16,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(34, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            : WallLayout(
                stones: List.generate(6, (index) {
                  final galleryImages = state.galleryfiles![index % 5];
                  return buildGalleryItem(
                      id: index,
                      tag: galleryImages.tag!,
                      imageUrl: galleryImages.mediaUrl!,
                      thumbnailUrl: galleryImages.thumbnailUrl!);
                }),
                layersCount: 5,
                scrollDirection: Axis.vertical,
                reverse: false,
              );
      },
    );
  }
}
