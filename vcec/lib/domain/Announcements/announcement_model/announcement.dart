import 'dart:convert';

class Announcement {
  int? id;
  String? title;
  String? content;
  String? posterImageUrl;
  String? thumbnailPosterImageUrl;
  String? whatsappLink;
  DateTime? publishDate;
  String? publishedBy;
  dynamic hashtags;
  String? buttonLink;
  String? buttonName;
  List<dynamic>? likedBy;
  int? totalLikes;

  Announcement({
    this.id,
    this.title,
    this.content,
    this.posterImageUrl,
    this.thumbnailPosterImageUrl,
    this.whatsappLink,
    this.publishDate,
    this.publishedBy,
    this.hashtags,
    this.buttonLink,
    this.buttonName,
    this.likedBy,
    this.totalLikes,
  });

  @override
  String toString() {
    return 'Announcement(id: $id, title: $title, content: $content, posterImageUrl: $posterImageUrl, thumbnailPosterImageUrl: $thumbnailPosterImageUrl, whatsappLink: $whatsappLink, publishDate: $publishDate, publishedBy: $publishedBy, hashtags: $hashtags, buttonLink: $buttonLink, buttonName: $buttonName, likedBy: $likedBy, totalLikes: $totalLikes)';
  }

  factory Announcement.fromMap(Map<String, dynamic> data) => Announcement(
        id: data['id'] as int?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        posterImageUrl: data['poster_image_url'] as String?,
        thumbnailPosterImageUrl: data['thumbnail_poster_image_url'] as String?,
        whatsappLink: data['whatsapp_link'] as String?,
        publishDate: data['publish_date'] == null
            ? null
            : DateTime.parse(data['publish_date'] as String),
        publishedBy: data['published_by'] as String?,
        hashtags: data['hashtags'] as dynamic,
        buttonLink: data['button_link'] as String?,
        buttonName: data['button_name'] as String?,
        likedBy: data['liked_by'] as List<dynamic>?,
        totalLikes: data['total_likes'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'poster_image_url': posterImageUrl,
        'thumbnail_poster_image_url': thumbnailPosterImageUrl,
        'whatsapp_link': whatsappLink,
        'publish_date': publishDate?.toIso8601String(),
        'published_by': publishedBy,
        'hashtags': hashtags,
        'button_link': buttonLink,
        'button_name': buttonName,
        'liked_by': likedBy,
        'total_likes': totalLikes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Announcement].
  factory Announcement.fromJson(String data) {
    return Announcement.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Announcement] to a JSON string.
  String toJson() => json.encode(toMap());

  Announcement copyWith({
    int? id,
    String? title,
    String? content,
    String? posterImageUrl,
    String? thumbnailPosterImageUrl,
    String? whatsappLink,
    DateTime? publishDate,
    String? publishedBy,
    dynamic hashtags,
    String? buttonLink,
    String? buttonName,
    List<dynamic>? likedBy,
    int? totalLikes,
  }) {
    return Announcement(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      posterImageUrl: posterImageUrl ?? this.posterImageUrl,
      thumbnailPosterImageUrl:
          thumbnailPosterImageUrl ?? this.thumbnailPosterImageUrl,
      whatsappLink: whatsappLink ?? this.whatsappLink,
      publishDate: publishDate ?? this.publishDate,
      publishedBy: publishedBy ?? this.publishedBy,
      hashtags: hashtags ?? this.hashtags,
      buttonLink: buttonLink ?? this.buttonLink,
      buttonName: buttonName ?? this.buttonName,
      likedBy: likedBy ?? this.likedBy,
      totalLikes: totalLikes ?? this.totalLikes,
    );
  }
}
