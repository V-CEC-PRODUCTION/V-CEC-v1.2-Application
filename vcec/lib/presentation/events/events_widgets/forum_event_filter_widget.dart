import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/announcements/announcements_cubit.dart';
import 'package:vcec/application/events/events_cubit.dart';
import 'package:vcec/application/forums/forums_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/domain/events/model/event_model/event_types.dart';

class ForumEventFilterWidget extends StatelessWidget {
  ForumEventFilterWidget({super.key});

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<ForumsCubit>(context).getForums();
    });
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<EventsCubit>(context).fetchEvents1(
              eventType: EventType.Upcoming,
              forum: 'all',
            );
            AuthTokenManager.instance.setForum('all');
            BlocProvider.of<AnnouncementCubit>(context).getAnnoucements1(
              forum: 'all',
            );
            AuthTokenManager.instance.setForum('all');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkGreen,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            minimumSize: const Size(50, 28), // Adjust the height here
          ),
          child: const Text(
            'All',
            style: TextStyle(color: kwhite),
          ),
        ),
        BlocBuilder<ForumsCubit, ForumsState>(
          builder: (context, state) {
            return state.isFailureOrSuccess.fold(() {
              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 0, 0, 0),
                            highlightColor:
                                const Color.fromARGB(255, 207, 207, 207),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 28,
                              width: 55,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(34, 0, 0, 0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              );
            },
                (either) => either.fold((l) {
                      return Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              4,
                              (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: 28,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(34, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      );
                    }, (forums) {
                      return Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              forums.length,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<EventsCubit>(context)
                                        .fetchEvents1(
                                      eventType: EventType.Upcoming,
                                      forum: forums[index].forumRoleName!,
                                    );
                                    AuthTokenManager.instance
                                        .setForum(forums[index].forumRoleName!);
                                    BlocProvider.of<AnnouncementCubit>(context)
                                        .getAnnoucements1(
                                      forum: forums[index].forumRoleName!,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isSelected ? kDarkGreen : kwhite,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    minimumSize: const Size(30, 28),
                                  ),
                                  child: Text(
                                    '${forums[index].displayName}',
                                    style: TextStyle(
                                        color:
                                            isSelected ? kwhite : kBlackBlurr,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }));
          },
        )
      ],
    );
  }
}
