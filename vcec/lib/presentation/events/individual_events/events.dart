import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcec/application/indeventscubit/indeventscubit_cubit.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/events/individual_events/verified.dart';
import 'package:vcec/strings/strings.dart';

class IndEventsPage extends StatelessWidget {
  IndEventsPage({super.key, required this.id});
  final int id;
  final ValueNotifier<bool> _isLiked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<IndEventsCubit>(context).getIndEvents(id: id);
    });
    final size1 = MediaQuery.of(context).size.width;
    return BlocConsumer<IndEventsCubit, IndEventsState>(
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
                      text: "Something wrong with your network6");
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
              _isLiked.value = state.indEvents!.isLiked!;
            },
          ),
        );
        state.isFailureOrSuccessForRegister.fold(
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
                            text: "Something wrong with your network8");
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
                  (r) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const VerifiedScreen();
                    }));
                  },
                ));
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
                            text: "Something wrong with your network7");
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
          return const Scaffold(
            body: Center(
              child: loadingWidget,
            ),
          );
        }

        return state.indEvents == null
            ? Scaffold(
                body: Padding(
                  padding: EdgeInsets.only(top: size1 * 0.2),
                  child: const Center(
                      child: Column(
                    children: [
                      SizedBox(
                        width: 320,
                        height: 320,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/img/nothing.png')))),
                      ),
                      Text(
                        'Nothing to Report',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                ),
              )
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
                    state.indEvents!.eventResult!.title!,
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
                                      '$baseUrl${state.indEvents!.eventResult!.posterImageUrl!}'),
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
                                state.indEvents!.eventResult!.content!,
                                style: const TextStyle(
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
                                                    '$baseUrl${state.indEvents!.conductedBy![index].imageUrl}'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          state.indEvents!.conductedBy!.length,
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
                              child: state.indEvents!.registerButton!
                                  ? ElevatedButton(
                                      onPressed: () {
                                        if (state
                                            .indEvents!.alreadyRegistered!) {
                                          displaySnackBar(
                                              context: context,
                                              text: 'Already Registered');
                                        } else {
                                          if (state.indEvents!.eventResult!
                                                  .registerButtonLink! ==
                                              'vcec_form') {
                                            BlocProvider.of<IndEventsCubit>(
                                                    context)
                                                .postRegister(id: id);
                                          } else {
                                            launchURL(
                                                state.indEvents!.eventResult!
                                                    .registerButtonLink!
                                                    .trim(),
                                                context);
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 4,
                                          backgroundColor: !state
                                                  .indEvents!.alreadyRegistered!
                                              ? const Color.fromARGB(
                                                  255, 55, 51, 51)
                                              : Colors.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      child: Text(
                                        state.indEvents!.alreadyRegistered!
                                            ? 'Registered'
                                            : 'Register',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    )
                                  : const SizedBox(),
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
                                      BlocProvider.of<IndEventsCubit>(context)
                                          .postLike(
                                              id: id,
                                              val: _isLiked.value
                                                  ? 'True'
                                                  : 'False');
                                    },
                                    child: SizedBox(
                                      child: Builder(builder: (context) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            !isLiked
                                                ? const Icon(
                                                    Icons.thumb_up_alt_outlined,
                                                    color: Colors.black,
                                                    size: 25,
                                                  )
                                                : const Icon(
                                                    Icons.thumb_up,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                            GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<IndEventsCubit>(
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
                                                      width: double.infinity,
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
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              )),
                                                          const SizedBox(
                                                            height: 40,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: state
                                                                  .isFailureOrSuccessForImgLikes
                                                                  .fold(() {
                                                                return ListView
                                                                    .separated(
                                                                  separatorBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Container(
                                                                      color: Colors
                                                                          .grey,
                                                                      height: 1,
                                                                    );
                                                                  },
                                                                  itemCount: 10,
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
                                                                          Shimmer
                                                                              .fromColors(
                                                                            baseColor: const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            highlightColor: const Color.fromARGB(
                                                                                255,
                                                                                207,
                                                                                207,
                                                                                207),
                                                                            child:
                                                                                Container(
                                                                              height: 50,
                                                                              width: 50,
                                                                              decoration: const BoxDecoration(color: Color.fromARGB(34, 0, 0, 0), shape: BoxShape.circle),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          Shimmer
                                                                              .fromColors(
                                                                            baseColor: const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            highlightColor: const Color.fromARGB(
                                                                                255,
                                                                                207,
                                                                                207,
                                                                                207),
                                                                            child:
                                                                                Container(
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
                                                                          a.fold(
                                                                              (l) {
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
                                              child: state.indEvents!
                                                          .isLiked! ==
                                                      false
                                                  ? Text(
                                                      isLiked
                                                          ? (state.indEvents!
                                                                      .totalLikes! +
                                                                  1)
                                                              .toString()
                                                          : state.indEvents!
                                                              .totalLikes!
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Text(
                                                      !isLiked
                                                          ? (state.indEvents!
                                                                      .totalLikes! -
                                                                  1)
                                                              .toString()
                                                          : state.indEvents!
                                                              .totalLikes!
                                                              .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                            ),
                                          ],
                                        );
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

  Future<void> launchURL(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      displaySnackBar(context: context, text: 'Could not launch url');
    }
  }
}
