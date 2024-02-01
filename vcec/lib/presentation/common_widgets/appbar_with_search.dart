import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shimmer/shimmer.dart';

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
                  color: Color.fromARGB(255, 40, 40, 40),
                  child: Row(
                    children: [
                      kwidth20,
                      AuthTokenManager.instance.imageUrl == null
                          ? Shimmer.fromColors(
                              baseColor: Color(0xFFC0C0C0),
                              highlightColor: Color(0xFFE8E8E8),
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor:
                                    Color.fromARGB(255, 113, 124, 124),
                              ))
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            AuthTokenManager.instance.name == null
                                ? '...'
                                : AuthTokenManager.instance.name!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      NotificationIcon(),
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
    String url = '$baseUrl$imageUrl'.replaceAll('auth//api/', 'auth/api/');
    String turl = '$baseUrl$thumbnailUrl'.replaceAll('auth//api/', 'auth/api/');
    print(url);
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
