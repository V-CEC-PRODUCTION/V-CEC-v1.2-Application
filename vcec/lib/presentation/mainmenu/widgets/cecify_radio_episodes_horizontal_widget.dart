import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/colors.dart';

class CecifyRadioEpisodesHorizontalWidget extends StatelessWidget {
  CecifyRadioEpisodesHorizontalWidget({
    super.key,
  });

  List<ValueNotifier<bool>> isSecondWidgetVisible =
      List.generate(9, (index) => ValueNotifier<bool>(false));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: List.generate(
              9,
              (index) => Padding(
                padding: EdgeInsets.only(
                  left: 10.0.w,
                  right: 10.w,
                ),
                child: GestureDetector(
                  onTap: () {
                    isSecondWidgetVisible[index].value =
                        !isSecondWidgetVisible[index].value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              // add poster image inside this
                              height: 180.w,
                              width: 180.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            ValueListenableBuilder<bool>(
                              valueListenable: isSecondWidgetVisible[index],
                              builder: (context, value, child) {
                                return Visibility(
                                  visible: value,
                                  child: Container(
                                    height: 180.w,
                                    width: 180.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            border: Border.all(
                                              width: 1.5.w,
                                              color: Colors.white,
                                            ),
                                          ),
                                          width: 35.w,
                                          height: 35.w,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            border: Border.all(
                                              width: 1.5.w,
                                              color: Colors.white,
                                            ),
                                          ),
                                          width: 35.w,
                                          height: 35.w,
                                          child: Image(
                                            height: 10.w,
                                            image: AssetImage(
                                                'assets/img/spotify-bw.png'),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            border: Border.all(
                                              width: 1.5.w,
                                              color: Colors.white,
                                            ),
                                          ),
                                          width: 35.w,
                                          height: 35.w,
                                          child: Image(
                                            height: 10.w,
                                            image: AssetImage(
                                                'assets/img/g-podcast-bw.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8.w, bottom: 4.5.w, top: 4.5.w),
                          child: SizedBox(
                            width: 170.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 0.w, bottom: 8.w),
                                  child: Text(
                                    'Subtitle',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.w,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
