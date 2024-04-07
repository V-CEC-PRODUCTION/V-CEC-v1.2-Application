import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/events/events_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/events/constant.dart';
import 'package:vcec/presentation/events/individual_events/events.dart';
import 'package:vcec/presentation/events/view_all_screen.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<EventsCubit>(context).fetchEvents1(
        eventType: EventType.Upcoming,
        forum: 'all',
      );
      AuthTokenManager.instance.setForum('all');
    });
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SubHeading(text: 'Events'),
              TextButton(
                onPressed: () {
                  final forum = AuthTokenManager.instance.forum;
                  BlocProvider.of<EventsCubit>(context).fetchEvents(
                    eventType: EventType.Upcoming,
                    forum: forum!,
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewAllScreen(),
                  ));
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: kBlackBlurr,
                  ),
                ),
              )
            ],
          ),
        ),
        BlocConsumer<EventsCubit, EventsState>(
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
                          text: "Something wrong with your network11");
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
                (upcomingEvents) {},
              ),
            );
          },
          builder: (context, state) {
            print(state);
            return state.isFailureOrSuccess.fold(() {
              return Shimmer.fromColors(
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
              );
            },
                (either) => either.fold((l) {
                      return Column(
                        children: [
                          Container(
                            height: 260.h,
                            width: 440.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: const AssetImage('assets/img/events2.png'),
                              fit: BoxFit.cover,
                            )),
                          ),
                          kheight10,
                          Text('No events',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      );
                    }, (events) {
                      return events.isEmpty
                          ? Column(
                              children: [
                                Container(
                                  height: 260.h,
                                  width: 440.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: const AssetImage(
                                        'assets/img/events2.png'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                kheight10,
                                Text('No events',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20))
                              ],
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    events.length,
                                    (index) => GestureDetector(
                                          child: EventsCardWidget(
                                            thumpnailUrl: events[index]
                                                .thumbnailPosterImageUrl!,
                                            pimgUrl:
                                                events[index].posterImageUrl!,
                                            imgUrl: events[index].likedBy,
                                            totalLikes:
                                                events[index].totalLikes,
                                            title: events[index].title!,
                                            subtitle: events[index].content,
                                            date: events[index].eventDate,
                                            time: commontime,
                                            tag: '',
                                            totalRegistrations: events[index]
                                                .totalRegistrations,
                                          ),
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  IndEventsPage(
                                                      id: events[index].id!),
                                            ));
                                          },
                                        )),
                              ),
                            );
                    }));
          },
        )
      ],
    );
  }
}
