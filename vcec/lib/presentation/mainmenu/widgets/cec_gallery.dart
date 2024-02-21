import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wall_layout/flutter_wall_layout.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/subpages/cec_gallery_screen1.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_tile.dart';

class CecGallery extends StatelessWidget {
  CecGallery({super.key});
  int galleryLength = 1;
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
        if (state.galleryfiles == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.04, top: 10),
                child: const SubHeading(text: 'CEC Gallery'),
              ),
              Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 0, 0, 0),
                highlightColor: const Color.fromARGB(255, 207, 207, 207),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: (size.width - 20) * 9 / 16,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(34, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          );
        } else {
          galleryLength = state.galleryfiles!.length;
          if (galleryLength > 6) {
            galleryLength = 6;
          }
          if (galleryLength == 0) {
            return const SizedBox();
          }
          return Column(
            children: [
              const _HeadingPortion(),
              WallLayout(
                stones: List.generate(galleryLength, (index) {
                  //  print(state.galleryfiles![index]);
                  final galleryImages = state.galleryfiles![index % 5];
                  return buildGalleryItem(
                      context: context,
                      id: index,
                      tag: galleryImages.tag!,
                      imageUrl: galleryImages.mediaUrl!,
                      thumbnailUrl: galleryImages.thumbnailUrl!);
                }),
                layersCount: 5,
                scrollDirection: Axis.vertical,
                reverse: false,
              ),
            ],
          );
        }
      },
    );
  }
}

class _HeadingPortion extends StatelessWidget {
  const _HeadingPortion();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          kwidth20,
          const SubHeading(text: 'CEC Gallery'),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CecGalleryScreen(),
                  ));
            },
            child: const Text('view all'),
          ),
          kwidth20,
        ],
      ),
    );
  }
}
