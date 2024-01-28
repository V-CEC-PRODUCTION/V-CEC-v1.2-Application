import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/domain/gallery/gallery_model/gallery_file.dart';
import 'package:vcec/presentation/mainmenu/subpages/video_player_screen.dart';
import 'package:vcec/strings/strings.dart';

class GallerySwipeView extends StatefulWidget {
  const GallerySwipeView({super.key, required this.offset});
  final int offset;
  @override
  State<GallerySwipeView> createState() => _GallerySwipeViewState();
}

class _GallerySwipeViewState extends State<GallerySwipeView> {
  late final PageController _pageController;
  late final List<GalleryFile> galleryfiles;
  @override
  void initState() {
    galleryfiles =
        BlocProvider.of<GalleryCubit>(context).state.galleryfiles ?? [];
    _pageController = PageController(initialPage: widget.offset);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final galleryfile = galleryfiles[index];
          if (galleryfile.tag == 'img') {
            return Image.network(
              baseUrl + galleryfile.mediaUrl!,
              fit: BoxFit.contain,
            );
          } else {
            return VideoPlayerScreen(url: baseUrl + galleryfile.videoUrl!);
          }
        },
        itemCount: galleryfiles.length,
      ),
    );
  }
}
