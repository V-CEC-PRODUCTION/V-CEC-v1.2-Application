import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcec/core/constants.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';
import 'package:vcec/presentation/cecify_radio/cecify_radio_screen.dart';
import 'package:vcec/presentation/cecify_radio/widgets/cecify_button_widget.dart';

class EpisodesListWidget extends StatelessWidget {
  const EpisodesListWidget(
      {super.key, required this.index, required this.model});
  final int index;
  final List<EpisodeResult> model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          model.length,
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
                              image: NetworkImage(model[index].imageUrl!),
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
                                model[index].content!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19.w),
                              ),
                              Text(
                                'Season ${model[index].seasonNumber}, Episode ${model[index].episode}',
                                style: TextStyle(fontSize: 13.w),
                              ),
                              kheight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  model[index].youtubeUrl == ''
                                      ? Container()
                                      : CecifyButtonWidget(
                                          title: 'Youtube',
                                          url: 'assets/img/youtube-logo.png', launchurl: model[index].youtubeUrl!,),
                                  model[index].spotifyUrl == ''
                                      ? Container()
                                      : CecifyButtonWidget(
                                          title: 'Spotify',
                                          url: 'assets/img/spotify-logo.png', launchurl:  model[index].spotifyUrl!,),
                                  model[index].googlePodcastUrl == ''
                                      ? Container()
                                      : CecifyButtonWidget(
                                          title: 'Podcast',
                                          url:
                                              'assets/img/Google_Podcasts-logo.png', launchurl:  model[index].googlePodcastUrl!,)
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
                    model[index].content!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 11.w, height: 0.w),
                  ),
                  Divider()
                ]),
              )),
    );
  }
}
