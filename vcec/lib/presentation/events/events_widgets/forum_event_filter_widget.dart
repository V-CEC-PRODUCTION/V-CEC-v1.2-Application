import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/forums/forums_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/events/constant.dart';

class ForumEventFilterWidget extends StatelessWidget {
  const ForumEventFilterWidget({super.key});

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
            print('object');
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
                                    return forumOnTap[index]();
                                  },
                                  child: Text(
                                    '${forums[index].displayName}',
                                    style: TextStyle(
                                        color: kBlackBlurr, fontSize: 12),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kwhite,
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    minimumSize: Size(30, 28),
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
