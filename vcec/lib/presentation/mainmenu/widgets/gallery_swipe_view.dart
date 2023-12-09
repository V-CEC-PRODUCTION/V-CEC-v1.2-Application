import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';

class GallerySwipeView extends StatefulWidget {
  const GallerySwipeView({super.key, required this.offset});
  final int offset;
  @override
  State<GallerySwipeView> createState() => _GallerySwipeViewState();
}

class _GallerySwipeViewState extends State<GallerySwipeView> {
  late final PageController _pageController;
  @override
  void initState() {
    BlocProvider.of<GalleryCubit>(context);
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
          return SizedBox.expand(
            child: Container(
              color: Colors.accents[index],
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
