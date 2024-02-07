import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/strings/strings.dart';

class EventsCardWidget extends StatelessWidget {
  const EventsCardWidget({
    Key? key,
    required this.imgUrl,
    required this.title,
    this.time,
    this.subtitle,
    this.date,
    this.tag,
    required this.thumpnailUrl,
  }) : super(key: key);
  final String thumpnailUrl;
  final String imgUrl;
  final String title;
  final String? time;
  final String? subtitle;
  final String? date;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Color.fromARGB(88, 0, 0, 0)),
      ),
      width: size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
            ),
            width: double.infinity,
            height: ((size.width * 0.65) - 12) / 16 * 9,
            child: ProgressiveImage(
                blur: 1,
                placeholder: NetworkImage('$baseUrl$thumpnailUrl'),
                thumbnail: NetworkImage('$baseUrl$thumpnailUrl'),
                image: NetworkImage('$baseUrl$imgUrl'),
                width: double.infinity,
                height: double.infinity),
          ),
          kheight5,
          // Event Title and Time
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: subtitle != null ? 1 : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          //   if (tag != null)
          Column(
            children: [
              //  Text(
              //    tag!,
              //    style: TextStyle(
              //      fontWeight: FontWeight.w500,
              //       fontSize: 12,
              //     ),
              //   ),
              kwidth10,

              // Event Subtitle
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        subtitle != null
                            ? Text(
                                subtitle!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 13,
                                ),
                              )
                            : SizedBox(),
                        if (date != null)
                          Text(
                            date!,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: size.width*0.01,
                          child: Container(
                            width: size.width * 0.07,
                            height: size.width * 0.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          left:size.width*0.065,
                          child: Container(
                            width: size.width * 0.07,
                            height: size.width * 0.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Positioned(
                          right: size.width*0.055,
                          child: Container(
                            width: size.width * 0.07,
                            height: size.width * 0.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        Positioned(
                       //   left: size.width*0.09,
                          child: Container(
                            width: size.width * 0.07,
                            height: size.width * 0.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )

          // Event Date
        ],
      ),
    );
  }
}
