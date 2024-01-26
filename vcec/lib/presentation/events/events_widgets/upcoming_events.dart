import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/cubit/events_cubit.dart';

import 'package:vcec/core/colors.dart';
import 'package:vcec/domain/events/model/event_types.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/common_snackbar.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/events/constant.dart';

class UpcomingEvents extends StatelessWidget {
  UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<EventsCubit>(context)
          .fetchEvents(eventType: EventType.Upcoming);
    });
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (failure == MainFailure.clientFailure()) {
                displaySnackBar(context: context, text: "Somthing went wrong");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Server Error'),
                  ),
                );
              }
            },
            (upcomingEvents) {},
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading || state.isFailureOrSuccess.isNone()) {
          return Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 0, 0, 0),
            highlightColor: Color.fromARGB(255, 207, 207, 207),
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
        }

        if (state.isFailureOrSuccess.isSome()) {
          state.isFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
              (failure) {},
              (success) {
                final events = state.events[EventType.Upcoming.name];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubHeading(text: 'Upcoming Events'),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: TextStyle(
                                color: kBlackBlurr,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            events!.length,
                            (index) => EventsCardWidget(
                                  thumpnailUrl:
                                      events[index].thumbnailPosterImageUrl,
                                  imgUrl: events[index].posterImageUrl,
                                  title: events[index].title,
                                  subtitle: events[index].content,
                                  date: commondate,
                                  time: commontime,
                                )),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Container(
          height: 288.h,
          width: 470.w,
          decoration: BoxDecoration(
            color: Color.fromARGB(33, 255, 7, 7),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }
}
