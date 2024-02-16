import 'dart:convert';

class Event {
  int? id;
  String? title;
  String? content;
  String? registerButtonLink;
  String? posterImageUrl;
  String? thumbnailPosterImageUrl;
  String? whatsappLink;
  String? status;
  DateTime? publishDate;
  String? publishedBy;
  dynamic hashtags;
  String? eventDate;
  int? totalRegistrations;
  List<dynamic>? likedBy;
  int? totalLikes;

  Event({
    this.id,
    this.title,
    this.content,
    this.registerButtonLink,
    this.posterImageUrl,
    this.thumbnailPosterImageUrl,
    this.whatsappLink,
    this.status,
    this.publishDate,
    this.publishedBy,
    this.hashtags,
    this.eventDate,
    this.totalRegistrations,
    this.likedBy,
    this.totalLikes,
  });

  @override
  String toString() {
    return 'Event(id: $id, title: $title, content: $content, registerButtonLink: $registerButtonLink, posterImageUrl: $posterImageUrl, thumbnailPosterImageUrl: $thumbnailPosterImageUrl, whatsappLink: $whatsappLink, status: $status, publishDate: $publishDate, publishedBy: $publishedBy, hashtags: $hashtags, eventDate: $eventDate, totalRegistrations: $totalRegistrations, likedBy: $likedBy, totalLikes: $totalLikes)';
  }

  factory Event.fromMap(Map<String, dynamic> data) => Event(
        id: data['id'] as int?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        registerButtonLink: data['register_button_link'] as String?,
        posterImageUrl: data['poster_image_url'] as String?,
        thumbnailPosterImageUrl: data['thumbnail_poster_image_url'] as String?,
        whatsappLink: data['whatsapp_link'] as String?,
        status: data['status'] as String?,
        publishDate: data['publish_date'] == null
            ? null
            : DateTime.parse(data['publish_date'] as String),
        publishedBy: data['published_by'] as String?,
        hashtags: data['hashtags'] as dynamic,
        eventDate: data['event_date'] as String?,
        totalRegistrations: data['total_registrations'] as int?,
        likedBy: data['liked_by'] as List<dynamic>?,
        totalLikes: data['total_likes'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'register_button_link': registerButtonLink,
        'poster_image_url': posterImageUrl,
        'thumbnail_poster_image_url': thumbnailPosterImageUrl,
        'whatsapp_link': whatsappLink,
        'status': status,
        'publish_date': publishDate?.toIso8601String(),
        'published_by': publishedBy,
        'hashtags': hashtags,
        'event_date': eventDate,
        'total_registrations': totalRegistrations,
        'liked_by': likedBy,
        'total_likes': totalLikes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Event].
  factory Event.fromJson(String data) {
    return Event.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Event] to a JSON string.
  String toJson() => json.encode(toMap());

  Event copyWith({
    int? id,
    String? title,
    String? content,
    String? registerButtonLink,
    String? posterImageUrl,
    String? thumbnailPosterImageUrl,
    String? whatsappLink,
    String? status,
    DateTime? publishDate,
    String? publishedBy,
    dynamic hashtags,
    String? eventDate,
    int? totalRegistrations,
    List<dynamic>? likedBy,
    int? totalLikes,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      registerButtonLink: registerButtonLink ?? this.registerButtonLink,
      posterImageUrl: posterImageUrl ?? this.posterImageUrl,
      thumbnailPosterImageUrl:
          thumbnailPosterImageUrl ?? this.thumbnailPosterImageUrl,
      whatsappLink: whatsappLink ?? this.whatsappLink,
      status: status ?? this.status,
      publishDate: publishDate ?? this.publishDate,
      publishedBy: publishedBy ?? this.publishedBy,
      hashtags: hashtags ?? this.hashtags,
      eventDate: eventDate ?? this.eventDate,
      totalRegistrations: totalRegistrations ?? this.totalRegistrations,
      likedBy: likedBy ?? this.likedBy,
      totalLikes: totalLikes ?? this.totalLikes,
    );
  }
}
