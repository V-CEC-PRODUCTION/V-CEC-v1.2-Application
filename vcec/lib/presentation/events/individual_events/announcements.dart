import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/indannouncements/indannouncements_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/strings/strings.dart';

class IndAnnouncementsPage extends StatelessWidget {
  IndAnnouncementsPage({super.key, required this.id});
  final int id;
  final ValueNotifier<bool> _isLiked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<IndAnnouncementsCubit>(context)
          .getIndAnnouncements(id: id);
    });
    final size1 = MediaQuery.of(context).size.width;
    return BlocConsumer<IndAnnouncementsCubit, IndAnnouncementsState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                      context: context,
                      text: "Something wrong with your network");
                } else if (failure == const MainFailure.authFailure()) {
                  displaySnackBar(
                      context: context, text: 'Access token timed out');
                } else {
                  displaySnackBar(
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              _isLiked.value = state.indAnnouncements!.isLiked!;
            },
          ),
        );

        state.isFailureOrSuccessForImgLikes.fold(
            () => {},
            (either) => either.fold(
                  (failure) {
                    if (!state.isLoading) {
                      if (failure == const MainFailure.serverFailure()) {
                        displaySnackBar(
                            context: context, text: "Server is down");
                      } else if (failure == const MainFailure.clientFailure()) {
                        displaySnackBar(
                            context: context,
                            text: "Something wrong with your network");
                      } else if (failure == const MainFailure.authFailure()) {
                        displaySnackBar(
                            context: context, text: 'Access token timed out');
                      } else {
                        displaySnackBar(
                            context: context,
                            text: "Something Unexpected Happened");
                      }
                    }
                  },
                  (r) {},
                ));
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: loadingWidget,
          );
        }

        return state.indAnnouncements == null
            ? const Center(child: Text('Error...'))
            : Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      iconSize: size1 * 0.05,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  centerTitle: true,
                  title: Text(
                    state.indAnnouncements!.announcementResult!.title!,
                    style: TextStyle(
                        fontSize: size1 * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size1 * 0.77,
                              width: size1 * 0.85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.yellow,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '$baseUrl${state.indAnnouncements!.announcementResult!.posterImageUrl!}'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size1 * 0.10, right: size1 * 0.09),
                              child: Text(
                                state.indAnnouncements!.announcementResult!
                                    .content!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.3,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: size1 * 0.57),
                              child: const Text(
                                'Conducted By',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size1 * 0.07),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size1 * 0.2,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: size1 * 0.02),
                                          child: Container(
                                            height: size1 * 0.1,
                                            width: size1 * 0.1,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.yellow,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    '$baseUrl${state.indAnnouncements!.conductedBy![index].imageUrl}'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.indAnnouncements!
                                          .conductedBy!.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size1 * 0.17,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Container(
                        height: size1 * 0.18,
                        color: Colors.white.withOpacity(0.7),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size1 * 0.10,
                            ),
                            SizedBox(
                              width: size1 * 0.6,
                              height: size1 * 0.13,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor:
                                        const Color.fromARGB(255, 55, 51, 51),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size1 * 0.07,
                            ),
                            SizedBox(
                              height: size1 * 0.13,
                              child: ValueListenableBuilder<bool>(
                                valueListenable: _isLiked,
                                builder: (context, isLiked, child) {
                                  return FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                        side: BorderSide(
                                            color: Colors.black, width: 0.095)),
                                    onPressed: () {
                                      _isLiked.value = !_isLiked.value;
                                      BlocProvider.of<IndAnnouncementsCubit>(
                                              context)
                                          .postLike(
                                              id: id,
                                              val: _isLiked.value
                                                  ? 'True'
                                                  : 'False');
                                    },
                                    child: SizedBox(
                                      child: Builder(builder: (context) {
                                        return Builder(builder: (context) {
                                          return Column(
                                            children: [
                                              isLiked
                                                  ? Positioned(
                                                      left: size1 * 0.04,
                                                      top: size1 * 0.02,
                                                      child: const Icon(
                                                        Icons.thumb_up,
                                                        color: Colors.black,
                                                        size: 25,
                                                      ),
                                                    )
                                                  : Positioned(
                                                      left: size1 * 0.04,
                                                      top: size1 * 0.02,
                                                      child: const Icon(
                                                        Icons
                                                            .thumb_up_alt_outlined,
                                                        color: Colors.black,
                                                        size: 25,
                                                      ),
                                                    ),
                                              Positioned(
                                                top: size1 * 0.034,
                                                right: 0,
                                                left: 0,
                                                child: TextButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                IndAnnouncementsCubit>(
                                                            context)
                                                        .getLikes(id: id);
                                                    showBottomSheet(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 21, 19, 19),
                                                      context: context,
                                                      builder: (context) {
                                                        return SizedBox(
                                                          height: 370,
                                                          width:
                                                              double.infinity,
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                  width: 40,
                                                                  height: 5,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  )),
                                                              const SizedBox(
                                                                height: 40,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: state
                                                                      .isFailureOrSuccessForImgLikes
                                                                      .fold(() {
                                                                    return ListView
                                                                        .separated(
                                                                      separatorBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Container(
                                                                          color:
                                                                              Colors.grey,
                                                                          height:
                                                                              1,
                                                                        );
                                                                      },
                                                                      itemCount:
                                                                          10,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Shimmer.fromColors(
                                                                                baseColor: const Color.fromARGB(255, 0, 0, 0),
                                                                                highlightColor: const Color.fromARGB(255, 207, 207, 207),
                                                                                child: Container(
                                                                                  height: 50,
                                                                                  width: 50,
                                                                                  decoration: const BoxDecoration(color: Color.fromARGB(34, 0, 0, 0), shape: BoxShape.circle),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 50,
                                                                              ),
                                                                              Shimmer.fromColors(
                                                                                baseColor: const Color.fromARGB(255, 0, 0, 0),
                                                                                highlightColor: const Color.fromARGB(255, 207, 207, 207),
                                                                                child: Container(
                                                                                  width: 50,
                                                                                  decoration: const BoxDecoration(
                                                                                    color: Color.fromARGB(34, 0, 0, 0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                          (a) =>
                                                                              a.fold((l) {
                                                                                return ListView.separated(
                                                                                  separatorBuilder: (context, index) {
                                                                                    return Container(
                                                                                      color: Colors.grey,
                                                                                      height: 1,
                                                                                    );
                                                                                  },
                                                                                  itemCount: 10,
                                                                                  itemBuilder: (context, index) {
                                                                                    return Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Shimmer.fromColors(
                                                                                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                                                                                            highlightColor: const Color.fromARGB(255, 207, 207, 207),
                                                                                            child: Container(
                                                                                              height: 50,
                                                                                              width: 50,
                                                                                              decoration: const BoxDecoration(color: Color.fromARGB(34, 0, 0, 0), shape: BoxShape.circle),
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 50,
                                                                                          ),
                                                                                          Shimmer.fromColors(
                                                                                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                                                                                            highlightColor: const Color.fromARGB(255, 207, 207, 207),
                                                                                            child: Container(
                                                                                              width: 50,
                                                                                              decoration: const BoxDecoration(
                                                                                                color: Color.fromARGB(34, 0, 0, 0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }, (r) {
                                                                                return ListView.separated(
                                                                                  separatorBuilder: (context, index) {
                                                                                    return Container(
                                                                                      color: Colors.grey,
                                                                                      height: 1,
                                                                                    );
                                                                                  },
                                                                                  itemCount: state.likes.length,
                                                                                  itemBuilder: (context, index) {
                                                                                    return Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 50,
                                                                                            height: 50,
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              color: Colors.yellow,
                                                                                              image: DecorationImage(
                                                                                                image: state.likes[index].imageUrl != null ? NetworkImage('$baseUrl${state.likes[index].imageUrl}') : const NetworkImage('https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                                                                fit: BoxFit.fill,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width: 50,
                                                                                          ),
                                                                                          Text(
                                                                                            state.likes[index].name!,
                                                                                            style: const TextStyle(color: Colors.white),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              })),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: state.indAnnouncements!
                                                              .isLiked! ==
                                                          false
                                                      ? Text(
                                                          isLiked
                                                              ? (state.indAnnouncements!
                                                                          .totalLikes! +
                                                                      1)
                                                                  .toString()
                                                              : state
                                                                  .indAnnouncements!
                                                                  .totalLikes!
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          !isLiked
                                                              ? (state.indAnnouncements!
                                                                          .totalLikes! -
                                                                      1)
                                                                  .toString()
                                                              : state
                                                                  .indAnnouncements!
                                                                  .totalLikes!
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      }),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
