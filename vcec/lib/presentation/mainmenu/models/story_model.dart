// ignore_for_file: public_member_api_docs, sort_constructors_first


enum MediaType { image, video }

class Story {
  final String url;
  final MediaType media;
  final Duration duration;

  Story({
    required this.url,
    required this.media,
    required this.duration,
  });
}
