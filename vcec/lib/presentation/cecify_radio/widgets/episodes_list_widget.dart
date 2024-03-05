import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/presentation/cecify_radio/cecify_radio_screen.dart';
import 'package:vcec/presentation/cecify_radio/widgets/cecify_button_widget.dart';

class EpisodesListWidget extends StatelessWidget {
  const EpisodesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          10,
          (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        height: 90.w,
                        width: 90.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: 353.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chapter 2012: Beyond the Classrooms',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.w),
                              ),
                              Text(
                                'Season 3, Episode 8',
                                style: TextStyle(fontSize: 13.w),
                              ),
                              kheight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CecifyButtonWidget(
                                      title: 'Youtube',
                                      url: 'assets/img/youtube-logo.png'),
                                  CecifyButtonWidget(
                                      title: 'Spotify',
                                      url: 'assets/img/spotify-logo.png'),
                                  CecifyButtonWidget(
                                      title: 'Podcast',
                                      url:
                                          'assets/img/Google_Podcasts-logo.png')
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  kheight10,
                  Text(
                    "Our podcast on Anuraj K A remarkable journey now features a new YouTube link for a smoother experience. The previous link had some technical issues. Apologies for any inconvenience. You can now stream the podcast on: Join us in celebrating CEC's spirit and Anuraj K A journey. Don't miss this treasure trove of experiences! Stay tuned, get CECified, and enjoy the podcast! ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 11.w, height: 0.w),
                  ),
                  Divider()
                ]),
              )),
    );
  }
}
