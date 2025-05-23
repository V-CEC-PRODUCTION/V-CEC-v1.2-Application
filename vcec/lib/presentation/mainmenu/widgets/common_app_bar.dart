import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/common_widgets/notification_icon.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  CommonAppBarWidget(
      {super.key, this.imageUrl, this.thumbnailUrl, this.name, this.value});
  final String? imageUrl;
  final String? thumbnailUrl;
  final String? name;
  final bool? value;
  final date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return DecoratedBox(
      decoration: const BoxDecoration(color: eventsappbarcolor),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 2.0),
        child: Row(
          children: [
            kwidth10,
            imageUrl == null
                ? Shimmer.fromColors(
                    baseColor: const Color(0xFFC0C0C0),
                    highlightColor: const Color(0xFFE8E8E8),
                    child: const CircleAvatar(
                      radius: 23,
                      backgroundColor: Color.fromARGB(255, 113, 124, 124),
                    ))
                : imageUrl == ''
                    ? const CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(
                            'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                      )
                    : _Banner(imageUrl: imageUrl!, thumbnailUrl: thumbnailUrl!),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 12),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    name == null
                        ? const SizedBox(
                            height: 10,
                          )
                        : FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Spacer(),
            value == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const NotificationIcon(),
                  )
                : const Text(
                    'Get Notified!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class _Banner extends StatelessWidget {
  const _Banner({required this.imageUrl, required this.thumbnailUrl});
  final String imageUrl;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Image.network(
                  thumbnailUrl.isEmpty ? imageUrl : thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
