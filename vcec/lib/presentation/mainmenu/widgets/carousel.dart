import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/main_menu/carousel/carousel_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/strings/strings.dart';

class CarouselMainManu extends StatelessWidget {
  const CarouselMainManu({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<CarouselCubit>(context).getCarouselImages();
    });
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          state.carouselFailureOrSuccess.fold(
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

        return state.carouselImages == null
            ? Shimmer.fromColors(
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
              )
            : SizedBox(
                height: (size.width - 20) * 9 / 16,
                width: size.width,
                child: CarouselSlider.builder(
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    final carousel = state.carouselImages![index];
                    return Container(
                      alignment: Alignment.center,
                      child: _Banner(
                        thumbnailUrl: carousel.thumbnailUrl!,
                        imageUrl: carousel.imageUrl!,
                      ),
                    );
                  },
                  slideTransform: const ParallaxTransform(),
                  autoSliderDelay: const Duration(seconds: 5),
                  autoSliderTransitionTime: const Duration(milliseconds: 300),
                  itemCount: state.carouselImages!.length,
                ),
              );
      },
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.imageUrl, required this.thumbnailUrl});
  final String imageUrl;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ProgressiveImage(
            blur: 1,
            fit: BoxFit.cover,
            placeholder: null,
            thumbnail: NetworkImage(thumbnailUrl),
            image: NetworkImage(imageUrl),
            width: double.infinity,
            height: double.infinity),
      ),
    );
  }
}

final image = [
  'https://images.unsplash.com/photo-1682695794947-17061dc284dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
  'https://ceconline.edu/wp-content/uploads/2022/07/pic1-01-2048x1152.jpeg',
  'https://images.unsplash.com/photo-1682871097944-07d4c897d47a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80',
];
