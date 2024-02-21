import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/notices/widgets/notices_tabbar.dart';
import 'package:vcec/strings/strings.dart';

class NoticesScreen extends StatelessWidget {
  NoticesScreen({super.key});

  final String? name = AuthTokenManager.instance.name;
  final String? imgUrl = AuthTokenManager.instance.imageUrl;
  final String? thumbnailUrl = AuthTokenManager.instance.thumbnailUrl;
  final date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.width * .35 * 518 / 1019),
        child: AppBar(
          backgroundColor: eventsappbarcolor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: CircleAvatar(
              child: imgUrl == null
                  ? const CircleAvatar(
                      radius: 23,
                      backgroundImage: NetworkImage(
                          'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'))
                  : _Banner(imageUrl: imgUrl!, thumbnailUrl: thumbnailUrl!),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
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
          actions: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: size * 0.05),
                child: const Column(
                  children: [
                    Text(
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
            ),
            kwidth20,
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight10,
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: size * 0.07, vertical: 14),
            child: const SubHeading(text: 'Notices'),
          ),
          const Expanded(child: NoticesTabbar())
        ],
      ),
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
    //  print(url);
    return CircleAvatar(
      radius: 20,
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
