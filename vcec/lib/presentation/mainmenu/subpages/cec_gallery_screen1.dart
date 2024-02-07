import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/gallery/gallery_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/avatar.dart';
import 'package:vcec/presentation/common_widgets/message_icon.dart';
import 'package:vcec/presentation/mainmenu/widgets/gallery_tab.dart';
import 'package:vcec/presentation/mainmenu/widgets/cec_gallery_img.dart';
import 'package:vcec/presentation/mainmenu/widgets/cec_gallery_vid.dart';

class CecGalleryScreen extends StatelessWidget {
  const CecGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<GalleryCubit>(context).getGalleryImages();
    });
    final size = MediaQuery.of(context).size;
    return BlocBuilder<GalleryCubit, GalleryState>(builder: (context, state) {
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
          : DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 75,
                  leadingWidth: 66,
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Avatar(),
                  ),
                  title: const Text(
                    'CEC Gallery',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black87,
                  centerTitle: true,
                  actions:  [
                    MessageIcon(),
                    kwidth20,
                  ],
                ),
                body: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: SizedBox(
                        width: 233,
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Photos',
                            ),
                            Tab(
                              text: 'Videos',
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          GalleryTab(),
                          GalleryTabImg(),
                          GalleryTabVid(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
