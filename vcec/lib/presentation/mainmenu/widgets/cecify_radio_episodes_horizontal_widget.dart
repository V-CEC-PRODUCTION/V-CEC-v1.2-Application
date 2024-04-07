import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vcec/domain/cecify/episodes/episodes_model.dart';

class CecifyRadioEpisodesHorizontalWidget extends StatelessWidget {
  CecifyRadioEpisodesHorizontalWidget({
    super.key,
    required this.imageUrl,
    required this.length,
  });
  final List<EpisodeResult> imageUrl;
  final int length;

  @override
  Widget build(BuildContext context) {
    List<ValueNotifier<bool>> isSecondWidgetVisible =
        List.generate(length, (index) => ValueNotifier<bool>(false));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              length,
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
                    height: 235.w,
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
                                    imageUrl[index].imageUrl!,
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
                                        GestureDetector(
                                          onTap: () {
                                            print(imageUrl[index].youtubeUrl!);
                                            print('hi');
                                            _launchUrl(Uri.parse(
                                                imageUrl[index].youtubeUrl!));
                                          },
                                          child: Container(
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
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _launchUrl(Uri.parse(
                                                imageUrl[index].spotifyUrl!));
                                          },
                                          child: Container(
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
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _launchUrl(Uri.parse(imageUrl[index]
                                                .googlePodcastUrl!));
                                          },
                                          child: Container(
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
                                  imageUrl[index].content!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 1.3.w,
                                    fontSize: 15.w,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
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

  Future<void> _launchUrl(Uri url1) async {
    if (!await launchUrl(url1)) {
      throw Exception('Could not launch $url1');
    }
  }
}
