import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';
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
      decoration: const BoxDecoration(color: Color(0xff2E3136)),
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
                      : Text(
                          name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              width: value == true ? size * 0.50 : size * 0.30,
            ),
            value == true
                ? const NotificationIcon()
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
    String url = imageUrl.replaceAll('auth//api/', 'auth/api/');
    String turl = thumbnailUrl.replaceAll('auth//api/', 'auth/api/');
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
