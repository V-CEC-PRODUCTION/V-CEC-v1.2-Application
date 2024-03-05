import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';

import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/auth_token_manager/auth_token_manager.dart';

import 'package:vcec/presentation/common_widgets/notification_icon.dart';
import 'package:vcec/presentation/common_widgets/search_field.dart';

import 'package:vcec/strings/strings.dart';

enum Department { cs, ec, eee, gs, as, lib, fac }

final date = DateFormat('dd-MM-yyyy').format(DateTime.now());

class AppbarWithSearch extends PreferredSize {
  final String hintText;
  final ValueNotifier isSearchNotifier;
  final Department? department;
  AppbarWithSearch({
    super.key,
    required this.isSearchNotifier,
    required this.hintText,
    this.department,
  }) : super(
          preferredSize: const Size(double.infinity, 150),
          child: SizedBox.expand(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 125,
                  color: const Color.fromARGB(255, 40, 40, 40),
                  child: Row(
                    children: [
                      kwidth20,
                      AuthTokenManager.instance.imageUrl == null
                          ? const CircleAvatar(
                              radius: 23,
                              backgroundImage: NetworkImage(
                                  'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTAxL3JtNjA5LXNvbGlkaWNvbi13LTAwMi1wLnBuZw.png'),
                            )
                          : _Banner(
                              imageUrl: AuthTokenManager.instance.imageUrl!,
                              thumbnailUrl:
                                  AuthTokenManager.instance.thumbnailUrl!),
                      kwidth20,
                      Column(
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
                          AuthTokenManager.instance.name == null
                              ? const SizedBox(
                                  height: 10,
                                )
                              : Text(
                                  AuthTokenManager.instance.name!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ],
                      ),
                      const Spacer(),
                      const NotificationIcon(),
                      kwidth10,
                      kwidth20,
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 100),
                  child: SearchField(
                    hintText: hintText,
                    isSearchNotifier: isSearchNotifier,
                    deptType: department,
                  ),
                )
              ],
            ),
          ),
        );
}

class _Banner extends StatelessWidget {
  const _Banner({required this.imageUrl, required this.thumbnailUrl});
  final String imageUrl;
  final String thumbnailUrl;
  @override
  Widget build(BuildContext context) {
    String url = imageUrl.replaceAll('auth//api/', 'auth/api/');
    String turl = thumbnailUrl.replaceAll('auth//api/', 'auth/api/');
    // print(url);
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
