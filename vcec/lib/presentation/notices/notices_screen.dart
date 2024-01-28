import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/notices/widgets/notices_tabbar.dart';
import 'package:vcec/strings/strings.dart';

class NoticesScreen extends StatelessWidget {
   NoticesScreen({super.key });

  final String? name = AuthTokenManager.instance.name;
  final String? imgUrl = AuthTokenManager.instance.imageUrl;
  final String? thumbnailUrl = AuthTokenManager.instance.thumbnailUrl;
  final date =   DateFormat('dd-MM-yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.width * .35 * 518 / 1019),
        child: AppBar(
          backgroundColor: eventsappbarcolor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: CircleAvatar(
              child: imgUrl == null ? Shimmer.fromColors(
                                      baseColor: Color(0xFFC0C0C0),
                                      highlightColor: Color(0xFFE8E8E8),
                                      child: CircleAvatar(
                                        radius: 23,
                                        backgroundColor:
                                            Color.fromARGB(255, 113, 124, 124),
                                      ))
                                  :
                     _Banner(imageUrl: imgUrl!, thumbnailUrl: thumbnailUrl!),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  name == null ? '...' : name!,
                  style: TextStyle(
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14),
            child: SubHeading(text: 'Notices'),
          ),
          Expanded(child: NoticesTabbar())
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
    print(url);
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