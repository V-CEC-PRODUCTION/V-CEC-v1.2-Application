import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/events/events_cubit.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/loading_widget.dart';
import 'package:vcec/presentation/events/individual_events/events.dart';

class ViewAllScreen extends StatelessWidget {
  ViewAllScreen({super.key});
  final scrollController = ScrollController();
  final forum = AuthTokenManager.instance.forum;
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<EventsCubit>(context).fetchEvents(
            eventType: EventType.Upcoming,
            forum: forum!,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<EventsCubit>(context).state;
    if (state.hasNext) {
      setupScrollController(context);
    }
    final size1 = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                iconSize: size1 * 0.05,
                onPressed: () {
                  Navigator.pop(context);
                  BlocProvider.of<EventsCubit>(context).fetchEvents1(
                      eventType: EventType.Upcoming, forum: forum!);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: Padding(
              padding: EdgeInsets.only(left: size1 * 0.24),
              child: Text(
                'Events',
                style: TextStyle(
                    fontSize: size1 * 0.05, fontWeight: FontWeight.bold),
              ),
            )),
        body:
            BlocConsumer<EventsCubit, EventsState>(listener: (context, state) {
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
                        text: "Something wrong with your network10");
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
              (events) {},
            ),
          );
        }, builder: (context, state) {
          if (state.isLoading && state.isFirstFetch) {
            return const Center(
              child: loadingWidget,
            );
          }

          return state.isFailureOrSuccess.fold(() {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 0, 0, 0),
                      highlightColor: const Color.fromARGB(255, 207, 207, 207),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 288.h,
                        width: 470.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(34, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 5);
          },
              (either) => either.fold(
                    (l) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 288.h,
                                  width: 470.w,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(33, 255, 7, 7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: 5);
                    },
                    (events) {
                      return events.isEmpty
                          ? Container(
                              height: 288.h,
                              width: 470.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(33, 255, 7, 7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          : ListView.separated(
                              controller:
                                  state.hasNext ? scrollController : null,
                              itemBuilder: (context, index) {
                                if (index < events.length) {
                                  return GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: EventsCardWidget(
                                        thumpnailUrl: events[index]
                                            .thumbnailPosterImageUrl!,
                                        pimgUrl: events[index].posterImageUrl!,
                                        imgUrl: events[index].likedBy,
                                        totalLikes: events[index].totalLikes,
                                        title: events[index].title!,
                                        subtitle: events[index].content,
                                        date: events[index].eventDate,
                                        tag: '',
                                        totalRegistrations:
                                            events[index].totalRegistrations,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => IndEventsPage(
                                            id: events[index].id!),
                                      ));
                                    },
                                  );
                                } else {
                                  Timer(const Duration(milliseconds: 30), () {
                                    if (scrollController.hasClients) {
                                      scrollController.jumpTo(scrollController
                                          .position.maxScrollExtent);
                                    }
                                  });

                                  return _loadingIndicator();
                                }
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount:
                                  events.length + (state.isLoading ? 1 : 0));
                    },
                  ));
        }));
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
