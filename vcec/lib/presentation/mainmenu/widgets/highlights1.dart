import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/main_menu/highlights/highlights_cubit.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/presentation/common_widgets/events_card_widget.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/strings/strings.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      BlocProvider.of<HighlightsCubit>(context).getHighlights();
    });
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HighlightsCubit, HighlightsState>(
        builder: (context, state) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        state.highlightsSuccessOrFailure.fold(
          () {},
          (either) => either.fold((failure) {
            if (failure == const MainFailure.clientFailure()) {
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04, top: 10),
                    child: const SubHeading(text: 'Highlights'),
                  ),
                  Shimmer.fromColors(
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
                  ),
                ],
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Something went wrong'),
                ),
              );
            }
          }, (success) {}),
        );
      });
      return state.highlights == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, top: 10),
                  child: const SubHeading(text: 'Highlights'),
                ),
                Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 0, 0, 0),
                  highlightColor: const Color.fromARGB(255, 207, 207, 207),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: ((size.width * 0.65) - 12) / 16 * 9,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(34, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.highlights!.result!.isNotEmpty
                    ? Padding(
                        padding:
                            EdgeInsets.only(left: size.width * 0.04, top: 10),
                        child: const SubHeading(text: 'Highlights'),
                      )
                    : const SizedBox(),
                kheight15,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      state.highlights!.result!.length,
                      (index) => EventsCardWidget(
                        pimgUrl: baseUrl +
                            state.highlights!.result![index].imageUrl!,
                        title: state.highlights!.result![index].content!,
                        thumpnailUrl: baseUrl +
                            state.highlights!.result![index].thumbnailUrl!,
                        date: state.highlights!.result![index].uploadTime!,
                        tag: state.highlights!.result![index].tag,
                      ),
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
