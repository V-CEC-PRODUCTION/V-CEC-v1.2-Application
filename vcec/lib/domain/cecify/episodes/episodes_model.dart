class EpisodeModel {
  final List<EpisodeResult>? episodesResult;

  EpisodeModel({required this.episodesResult});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      episodesResult: (json['episodes_result'] as List)
          .map((e) => EpisodeResult.fromJson(e))
          .toList(),
    );
  }
  
}

class EpisodeResult {
  int? id;
  int? seasonNumber;
  int? episode;
  String? content;
  String? imageUrl;
  String? thumbnailUrl;
  String? uploadTime;
  String? spotifyUrl;
  String? youtubeUrl;
  String? googlePodcastUrl;

  EpisodeResult(
      {required this.id,
      required this.seasonNumber,
      required this.episode,
      required this.content,
      required this.imageUrl,
      required this.thumbnailUrl,
      required this.uploadTime,
      required this.spotifyUrl,
      required this.youtubeUrl,
      required this.googlePodcastUrl});

  factory EpisodeResult.fromJson(Map<String, dynamic> json) {
    return EpisodeResult(
      id: json['id'] ?? 0,
      seasonNumber: json['season_number'] ?? 0,
      episode: json['episode'] ?? 0,
      content: json['content'] ?? '',
      imageUrl: json['image_url'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      uploadTime: json['upload_time'] ?? '',
      spotifyUrl: json['spotify_url'] ?? '',
      youtubeUrl: json['youtube_url'] ?? '',
      googlePodcastUrl: json['google_podcast_url'] ?? '',
    );
  }
}
