import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/announcements/announcements_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/events/individual_events/announcements.dart';
import 'package:vcec/presentation/events/individual_events/view_all_announcements.dart';

class AnnouncementsEventsWidget extends StatelessWidget {
  const AnnouncementsEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<AnnouncementCubit>(context).getAnnoucements1(
        forum: 'all',
      );
    });
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SubHeading(text: 'Announcements'),
            TextButton(
                onPressed: () {
                  final forum = AuthTokenManager.instance.forum;
                  BlocProvider.of<AnnouncementCubit>(context).getAnnoucements(
                    forum: forum!,
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewAllAnnouncements(),
                  ));
                },
                child: const Text('View All',
                    style: TextStyle(
                      color: kBlackBlurr,
                    )))
          ],
        ),
      ),
      BlocBuilder<AnnouncementCubit, AnnouncementState>(
        builder: (context, state) {
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
                    return Container(
                      height: 288.h,
                      width: 470.w,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(33, 255, 7, 7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }, (announcements) {
                    return announcements.isEmpty
                        ? Container(
                            height: 288.h,
                            width: 470.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(33, 255, 7, 7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  announcements.length,
                                  (index) => GestureDetector(
                                        child: EventsCardWidget(
                                          thumpnailUrl: announcements[index]
                                              .thumbnailPosterImageUrl!,
                                          pimgUrl: announcements[index]
                                              .posterImageUrl!,
                                          title: announcements[index].title!,
                                          subtitle:
                                              announcements[index].content!,
                                          tag: '',
                                          totalLikes:
                                              announcements[index].totalLikes,
                                          imgUrl: announcements[index].likedBy,
                                        ),
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                IndAnnouncementsPage(
                                                    id: announcements[index]
                                                        .id!),
                                          ));
                                        },
                                      )),
                            ),
                          );
                  }));
        },
      )
    ]);
  }
}
