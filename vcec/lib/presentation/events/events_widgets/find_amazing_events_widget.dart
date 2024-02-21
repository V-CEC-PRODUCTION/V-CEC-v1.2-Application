import 'package:flutter/material.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/presentation/events/events_functions/search_onsubmit_function.dart';

TextEditingController control = TextEditingController();
int eventsAroundYouNum = 52;

class FindAmazingEventsWidget extends StatelessWidget {
  const FindAmazingEventsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: eventsappbarcolor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              'Find Amazing Events',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kwhite, fontSize: 19),
            ),
          ),
          //  Padding(
          //     padding: const EdgeInsets.only(left: 14),
          //    child: Text(
          //      '$eventsAroundYouNum events around you',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold, color: kwhite, fontSize: 13),
          //     ),
          //    ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12, right: 12, top: 12.0, bottom: 25),
            child: Row(
              children: [
                Expanded(
                  child: SearchTextFieldWidget(
                    controller: control,
                    onSubmitted: onSubmit,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 6, right: 6, top: 2.5, bottom: 1.5),
                      child: Icon(
                        Icons.sort,
                        size: 31,
                        color: Color.fromRGBO(34, 82, 48, 0.92),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;

  const SearchTextFieldWidget({
    super.key,
    required this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(6),
        // border: Border.all(
        //   width: 1,
        //   color: Colors.grey[400]!,
        // ),
      ),
      constraints: const BoxConstraints(
        maxHeight: 40,
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              onSubmitted!(controller.text);
            },
            icon: const Icon(Icons.search, size: 20),
          ),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
