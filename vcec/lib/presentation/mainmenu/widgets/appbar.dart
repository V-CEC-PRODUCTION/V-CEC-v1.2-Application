import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/application/profile/profile_cubit.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/failure/main_failure.dart';
import 'package:vcec/domain/mainmenu/timetable/time_table/result.dart';
import 'package:vcec/presentation/common_widgets/avatar.dart';
import 'package:vcec/presentation/common_widgets/message_icon.dart';
import 'package:vcec/presentation/common_widgets/notification_icon.dart';
import 'dart:developer';

import 'package:vcec/presentation/profile/profile.dart';
import 'package:vcec/strings/strings.dart';

class MainmenuAppbar extends StatefulWidget {
  const MainmenuAppbar(
      {super.key,
      this.timeTable,
      required this.currentPeriod,
      required this.duration,
      this.imageUrl, this.thumbnailUrl});

  final TimeTable? timeTable;
  final String? imageUrl;
  final String? thumbnailUrl;
  final String currentPeriod;
  final String duration;
  @override
  State<MainmenuAppbar> createState() => _MainmenuAppbarState();
}

class _MainmenuAppbarState extends State<MainmenuAppbar> {
  bool initial = true;
  bool expanded = false;
  bool isOpen = false;
  final collapsedHeight = 65.0;
  final expandedHeight = 225.0;
  late final Avatar avatar;
  @override
  void initState() {
    log(widget.timeTable.toString());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    String formattedDate =
        DateFormat('dd EEE').format(DateTime.now()).toUpperCase();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initial = false;
    });
    return TweenAnimationBuilder(
        curve: Curves.ease,
        tween: Tween<double>(
            begin: initial
                ? collapsedHeight
                : isOpen
                    ? collapsedHeight
                    : expandedHeight,
            end: initial
                ? collapsedHeight
                : isOpen
                    ? expandedHeight
                    : collapsedHeight),
        duration: const Duration(milliseconds: 400),
        onEnd: () => setState(() {
              if (!expanded) {
                expanded = isOpen;
              }
            }),
        builder: (context, value, child) {
          return SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
            toolbarHeight: value,
            title: AnimatedContainer(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 400),
                height: isOpen ? expandedHeight : collapsedHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: isOpen
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))
                        : null,
                    color: kprimaryColor),
                child: Column(
                  children: [
                    Container(
                      color: kblack,
                      height: collapsedHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()));
                              },
                              child: widget.imageUrl == null
                                  ? Shimmer.fromColors(
                                      baseColor: Color(0xFFC0C0C0),
                                      highlightColor: Color(0xFFE8E8E8),
                                      child: CircleAvatar(
                                        radius: 23,
                                        backgroundColor:
                                            Color.fromARGB(255, 113, 124, 124),
                                      ))
                                  :_Banner(imageUrl: widget.imageUrl!, thumbnailUrl: widget.thumbnailUrl!)),
                          GestureDetector(
                            onTap: () {
                              widget.timeTable == null
                                  ? log('loading')
                                  : setState(() {
                                      if (isOpen) {
                                        expanded = false;
                                      }
                                      isOpen = !isOpen;
                                    });
                            },
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.29 * 2 +
                                      21,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  _TimeTableWiget(text: widget.duration),
                                  _VerticalDivider(),
                                  _TimeTableWiget(text: widget.currentPeriod),
                                ],
                              ),
                            ),
                          ),
                          NotificationIcon(),
                        ],
                      ),
                    ),
                    expanded
                        ? TweenAnimationBuilder(
                            curve: Curves.ease,
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      color: Color.fromRGBO(209, 219, 216, 1),
                                      child: Row(
                                        children: [
                                          kwidth10,
                                          time.hour < 16
                                              ? Text('Today\'s Classes',
                                                  style: TextStyle(
                                                      color: kblack,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600))
                                              : Text('Tomorrow \'s Classes',
                                                  style: TextStyle(
                                                      color: kblack,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                          Spacer(),
                                          Text(formattedDate,
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600)),
                                          kwidth10
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _TimeTableWidget(
                                          text: widget.timeTable!.firsttime!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.secondtime!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.thirdtime!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.fourthtime!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.fifthtime!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.sixthtime!,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _TimeTableWidget(
                                          text: widget.timeTable!.firstcode!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.secondcode!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.thirdcode!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.fourthcode!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.fifthcode!,
                                        ),
                                        _TimeTableWidget(
                                          text: widget.timeTable!.sixthcode!,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            duration: const Duration(milliseconds: 300),
                          )
                        : SizedBox()
                  ],
                )),
            pinned: true,
          );
        });
  }
}

class _TimeTableWidget extends StatelessWidget {
  const _TimeTableWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color: kblack.withOpacity(0.4),
            width: 1,
          ),
          right: BorderSide(
            color: kblack.withOpacity(0.4),
            width: 1,
          ),
        )),
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kwhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeTableWiget extends StatelessWidget {
  const _TimeTableWiget({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.29,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 53, 53, 53),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: kwhite, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 30,
      color: const Color.fromARGB(255, 198, 198, 198),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({required this.imageUrl, required this.thumbnailUrl});
  final String imageUrl;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    String url = '$baseUrl$imageUrl'.replaceAll('auth//api/', 'auth/api/');
    String turl = '$baseUrl$thumbnailUrl'.replaceAll('auth//api/', 'auth/api/');
    return CircleAvatar(
      radius: 23,
      child: ClipOval(
        child: ProgressiveImage(
            blur: 1,
            fit: BoxFit.cover,
            placeholder: null,
            thumbnail: NetworkImage(turl),
            image: NetworkImage(url),
            width: double.infinity,
            height: double.infinity),
      ),
    );
  }
}
