import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:vcec/core/colors.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';
import 'package:vcec/presentation/common_widgets/sub_heading.dart';
import 'package:vcec/presentation/mainmenu/widgets/common_app_bar.dart';
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
      appBar: CommonAppBarWidget(
        imageUrl: imgUrl,
        thumbnailUrl: thumbnailUrl,
        name: name,
        value: false,
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
    String url = imageUrl.replaceAll('auth//api/', 'auth/api/');
    String turl = thumbnailUrl.replaceAll('auth//api/', 'auth/api/');
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
