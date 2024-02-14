import 'dart:convert';

class EventResult {
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
  String? hashtags;
  String? eventDate;

  EventResult({
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
  });

  @override
  String toString() {
    return 'EventResult(id: $id, title: $title, content: $content, registerButtonLink: $registerButtonLink, posterImageUrl: $posterImageUrl, thumbnailPosterImageUrl: $thumbnailPosterImageUrl, whatsappLink: $whatsappLink, status: $status, publishDate: $publishDate, publishedBy: $publishedBy, hashtags: $hashtags, eventDate: $eventDate)';
  }

  factory EventResult.fromMap(Map<String, dynamic> data) => EventResult(
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
        hashtags: data['hashtags'] as String?,
        eventDate: data['event_date'] as String?,
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
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EventResult].
  factory EventResult.fromJson(String data) {
    return EventResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EventResult] to a JSON string.
  String toJson() => json.encode(toMap());

  EventResult copyWith({
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
    String? hashtags,
    String? eventDate,
  }) {
    return EventResult(
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
    );
  }
}
