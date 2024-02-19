import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/strings/strings.dart';

class EventsCardWidget extends StatelessWidget {
  const EventsCardWidget({
    super.key,
    this.imgUrl,
    required this.title,
    this.time,
    this.subtitle,
    this.date,
    this.tag,
    required this.thumpnailUrl,
    this.totalLikes,
    required this.pimgUrl,
    this.totalRegistrations,
  });
  final String thumpnailUrl;
  final int? totalRegistrations;
  final String pimgUrl;
  final List<dynamic>? imgUrl;
  final int? totalLikes;
  final String title;
  final String? time;
  final String? subtitle;
  final String? date;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: const Color.fromARGB(88, 0, 0, 0)),
      ),
      width: size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
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
                image: NetworkImage('$baseUrl$pimgUrl'),
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
                  style: const TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          if (tag != null)
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
                                  style: const TextStyle(
                                    height: 1.2,
                                    fontSize: 13,
                                  ),
                                )
                              : const SizedBox(),
                          if (date != null)
                            Text(
                              date!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          totalRegistrations == 0 || totalRegistrations == null
                              ? const SizedBox()
                              : Text(
                                  '$totalRegistrations people joined',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: (totalLikes == 0 && imgUrl!.isEmpty) ||
                              totalLikes == null
                          ? const SizedBox()
                          : (totalLikes! - 1) == 0 && imgUrl!.length == 1
                              ? Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Container(
                                      width: size.width * 0.07,
                                      height: size.width * 0.07,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: NetworkImage(imgUrl![0] !=
                                                    null
                                                ? '$baseUrl${imgUrl![0]}'
                                                : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  ],
                                )
                              : (totalLikes! - 2) == 0 && imgUrl!.length == 2
                                  ? Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          width: size.width * 0.07,
                                          height: size.width * 0.07,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                            image: DecorationImage(
                                                image: NetworkImage(imgUrl![
                                                            1] !=
                                                        null
                                                    ? '$baseUrl${imgUrl![1]}'
                                                    : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Positioned(
                                          left: size.width * 0.168,
                                          child: Container(
                                            width: size.width * 0.07,
                                            height: size.width * 0.07,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                              image: DecorationImage(
                                                  image: NetworkImage(imgUrl![
                                                              0] !=
                                                          null
                                                      ? '$baseUrl${imgUrl![0]}'
                                                      : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : (totalLikes! - 3) == 0 &&
                                          imgUrl!.length == 3
                                      ? Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Container(
                                              width: size.width * 0.07,
                                              height: size.width * 0.07,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    image: NetworkImage(imgUrl![
                                                                2] !=
                                                            null
                                                        ? '$baseUrl${imgUrl![2]}'
                                                        : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Positioned(
                                              left: size.width * 0.168,
                                              child: Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: NetworkImage(imgUrl![
                                                                  1] !=
                                                              null
                                                          ? '$baseUrl${imgUrl![1]}'
                                                          : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: size.width * 0.12,
                                              child: Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                  image: DecorationImage(
                                                      image: NetworkImage(imgUrl![
                                                                  0] !=
                                                              null
                                                          ? '$baseUrl${imgUrl![0]}'
                                                          : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Positioned(
                                              left: size.width * 0.055,
                                              child: Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                  image: DecorationImage(
                                                      image: NetworkImage(imgUrl![
                                                                  0] !=
                                                              null
                                                          ? '$baseUrl${imgUrl![0]}'
                                                          : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: size.width * 0.113,
                                              child: Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: NetworkImage(imgUrl![
                                                                  1] !=
                                                              null
                                                          ? '$baseUrl${imgUrl![1]}'
                                                          : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: size.width * 0.055,
                                              child: Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green,
                                                  image: DecorationImage(
                                                      image: NetworkImage(imgUrl![
                                                                  2] !=
                                                              null
                                                          ? '$baseUrl${imgUrl![2]}'
                                                          : 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Container(
                                                width: size.width * 0.07,
                                                height: size.width * 0.07,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '+${totalLikes! - 3}',
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
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
